require 'bundler'
require 'belugas/ruby/dependency'

# This code belongs to GemnasiumParser
# url: https://github.com/gemnasium/gemnasium-parser
require 'belugas/ruby/parser/patterns'

module Belugas
  module Ruby
    module Parser
      class Gemfile
        FALLBACK_RUBY_VERSION = "2.4"

        attr_reader :content
        attr_writer :runtime_groups

        def initialize(content)
          @content = content
        end


        def dependencies
          @bundler_dependencies ||= [].tap do |deps|
            gem_matches.each do |match|
              dep = Belugas::Ruby::Dependency.new dependency(match)
              deps << dep if dep
            end
          end
        end

        def ruby_version
          ENV['FALLBACK_RUBY_VERSION'] || content.scan(/ruby ["'](.*?)["']/).flatten[0] || FALLBACK_RUBY_VERSION
        end

        private

        def runtime_groups
          @runtime_groups ||= [:default, :production]
        end

        def gem_matches
          @gem_matches ||= matches(Patterns::GEM_CALL)
        end

        def matches(pattern)
          [].tap{|m| content.scan(pattern){ m << Regexp.last_match } }
        end

        def dependency(match)
          opts = Patterns.options(match["opts"])
          clean!(match, opts)
          name, reqs = match["name"], [match["req1"], match["req2"]].compact
          Bundler::Dependency.new(name, reqs, opts).tap do |dep|
            line = content.slice(0, match.begin(0)).count("\n") + 1
            dep.instance_variable_set(:@line, line)
          end
        end

        def groups(match)
          group = group_matches.detect{|m| in_block?(match, m) }
          group && Patterns.values(group[:grps])
        end

        def in_block?(inner, outer)
          outer.begin(:blk) <= inner.begin(0) && outer.end(:blk) >= inner.end(0)
        end

        def group_matches
          @group_matches ||= matches(Patterns::GROUP_CALL)
        end

        def exclude?(match, opts)
          git?(match, opts) || github?(match, opts) || path?(match, opts)
        end

        def git?(match, opts)
          opts["git"] || in_git_block?(match)
        end

        def github?(match, opts)
          opts["github"]
        end

        def in_git_block?(match)
          git_matches.any?{|m| in_block?(match, m) }
        end

        def git_matches
          @git_matches ||= matches(Patterns::GIT_CALL)
        end

        def path?(match, opts)
          opts["path"] || in_path_block?(match)
        end

        def in_path_block?(match)
          path_matches.any?{|m| in_block?(match, m) }
        end

        def path_matches
          @path_matches ||= matches(Patterns::PATH_CALL)
        end

        def clean!(match, opts)
          opts["group"] ||= opts.delete("groups")
          opts["group"] ||= groups(match)
          groups = Array(opts["group"]).flatten.compact
          runtime = groups.empty? || !(groups & runtime_groups).empty?
          opts["type"] ||= runtime ? :runtime : :development
        end

        def gemspec_match
          return @gemspec_match if defined?(@gemspec_match)
          @gemspec_match = content.match(Patterns::GEMSPEC_CALL)
        end
      end
    end
  end
end

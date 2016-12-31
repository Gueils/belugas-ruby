require 'belugas/ruby/feature/handler'
require 'belugas/ruby/feature/builder'
require 'belugas/ruby/parser/gemfile'
require 'belugas/ruby/standard_names/base'

module Belugas
  module Ruby
    class Dispatcher
      def initialize(path)
        @gemfile = Belugas::Ruby::Parser::Gemfile.new(path)
        @feature_handler = Belugas::Ruby::Feature::Handler.new(ruby_feature)
      end

      def render
        append_features
        @feature_handler.encode.each do |feature|
          STDOUT.print feature.to_json
          STDOUT.print "\0"
        end
      end

      private

      def ruby_feature
        @ruby_feature ||= [{
          "type" => "feature",
          "name" => "Ruby",
          "version" => @gemfile.ruby_version,
          "description" => "The application uses Ruby code",
          "content" => "",
          "categories" => ["Language"],
          "cue_locations" => [],
          "engines" => ["belugas", "belugas-ruby"]
        }]
      end

      def dependencies
        @dependencies ||= @gemfile.dependencies.map do |dependency|
          dependency_name = StandardNames::Base::NAMES[dependency.name]

          if dependency_name && !existing_dependencies.include?(dependency_name)
            existing_dependencies << dependency_name
            dependency.update dependency_name
          end

        end.compact
      end

      def existing_dependencies
        @existing_dependencies ||= []
      end

      def features
        @features ||= dependencies.map do |dependency|
          Belugas::Ruby::Feature::Builder.new(dependency)
        end
      end

      def append_features
        features.each do |feature|
          transcoded[feature.name] = feature.attributes
        end
      end

      def transcoded
        @transcoded ||= @feature_handler.transcode
      end
    end
  end
end

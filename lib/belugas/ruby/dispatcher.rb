require 'belugas/ruby/feature/handler'
require 'belugas/ruby/feature/builder'
require 'belugas/ruby/parser/gemfile'
require 'belugas/ruby/client'
require 'belugas/ruby/remote_dependency'

module Belugas
  module Ruby
    class Dispatcher
      def initialize(path)
        @gemfile = Belugas::Ruby::Parser::Gemfile.new(path)
        data = load_previous_results
        @feature_handler = Belugas::Ruby::Feature::Handler.new(data)
      end

      def update_previous_engine_results
        update_ruby_version
        update_engines
      end

      def render
        append_features
        @feature_handler.encode
      end

      private

      def update_ruby_version
        transcoded["Ruby"]["version"] = @gemfile.ruby_version
      end

      def update_engines
        transcoded["Ruby"]["engines"] << "belugas-ruby"
      end

      def names_with_standard_names
        @names_with_standard_names ||= Belugas::Ruby::Client.dependency_names(@gemfile.dependencies.map(&:name))
      end

      def remote_dependencies
        @remote_dependencies ||= names_with_standard_names.map do |name, standard_name|
          Belugas::Ruby::RemoteDependency.new(name, standard_name)
        end
      end

      def features
        @features ||= remote_dependencies.map do |dependency|
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

      def load_previous_results
        JSON.parse File.read("/previous-engine-results.json")
      end
    end
  end
end

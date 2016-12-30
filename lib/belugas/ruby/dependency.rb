module Belugas
  module Ruby
    class Dependency
      def initialize(bundler_dependency)
        @bundler_dependency = bundler_dependency
      end

      def name
        @bundler_dependency.name
      end

      def version
        @version ||= @bundler_dependency.requirement.requirements.flatten.join
      end

      def to_json(*a)
        {
          name: name,
          version: version
        }.to_json(*a)
      end
    end
  end
end

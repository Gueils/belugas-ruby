module Belugas
  module Ruby
    class Dependency
      attr_accessor :standard_name

      def initialize(bundler_dependency)
        @bundler_dependency = bundler_dependency
      end

      def name
        @bundler_dependency.name
      end

      def version
        @version ||= if categories.include?("Database")
                       database_version
                     else
                       @bundler_dependency.requirement.requirements.flatten.join.match(Belugas::Ruby::Parser::Patterns::GEM_VERSION).to_s
                     end
      end

      def update(new_name)
        @standard_name = new_name
        self
      end

      def categories
        StandardNames::NAMES[name] && StandardNames::NAMES[name]["categories"]
      end

      def to_json(*a)
        {
          name: name,
          version: version
        }.to_json(*a)
      end

      private

        def database_version
          case StandardNames::NAMES[name]["standard_name"]
            when "postgresql" then "9.6"
            when "mysql" then "5.7"
            else
              "0"
          end
        end
    end
  end
end

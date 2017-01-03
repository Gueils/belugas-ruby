module Belugas
  module Ruby
    class LibrariesCollection
      def initialize(dependencies)
        @dependencies = dependencies
      end

      def dependencies
        @dependencies.map do |dependency|
          dependency_name = StandardNames::NAMES[dependency.name] #=> {standard_name: "", categories: []}
          if dependency_name && dependency_name["standard_name"]
            dependency.update dependency_name["standard_name"]
          end
        end.compact
      end
    end
  end
end

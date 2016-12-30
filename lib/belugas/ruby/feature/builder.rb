module Belugas
  module Ruby
    module Feature
      class Builder
        attr_reader :name

        def initialize(dependency)
          @dependency = dependency
          @name = dependency.name
        end

        def attributes
          {
            "type" => "feature",
            "name" => @dependency.standard_name,
            "version" => @dependency.version,
            "description" => "The application uses #{@dependency.standard_name}",
            "content" => "",
            "categories" => ["Language"],
            "cue_locations" => [""],
            "engines" => ["belugas", "belugas-ruby"]
          }
        end
      end
    end
  end
end

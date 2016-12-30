module Belugas
  module Ruby
    module Feature
      class Handler
        def initialize(data)
          @data = data
        end

        def transcode
          @transcode ||= @data.reduce({}) do |hash, feature|
            hash[feature["name"]] = feature
            hash
          end
        end

        def encode
          transcode.values.to_json
        end

        def update
        end
      end
    end
  end
end

require 'httparty'

module Belugas
  module Ruby
    class Client
      include HTTParty
      base_uri ENV["WHALESAPI_URL"]

      def self.dependency_names(names)
        response = get "/feature_names", query: { names: names }
        JSON.parse response.body
      end
    end
  end
end

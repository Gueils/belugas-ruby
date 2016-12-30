require "thor"
require "json"
require 'belugas/ruby/parser/gemfile'
require 'belugas/ruby/dispatcher'

module Belugas
  module Ruby
    class Sonar < Thor
      package_name "belugas-ruby"

      desc "analyze --gemfile-path=/app/code", "Ruby feature detection JSON"
      method_option "gemfile-path", type: :string, default: "/code/Gemfile", required: false, aliases: "-p"
      def analyze
        dispatcher = Belugas::Ruby::Dispacher.new(options)
        dispatcher.update_previous_engine_results
        dispatcher.render
      end
    end
  end
end

require "belugas/ruby/version"

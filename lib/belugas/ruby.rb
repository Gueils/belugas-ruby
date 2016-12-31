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
        dispatcher = Belugas::Ruby::Dispatcher.new(options["gemfile-path"])
        dispatcher.render
      end
    end
  end
end

require "belugas/ruby/version"

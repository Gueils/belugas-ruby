require "thor"
require "json"
require 'belugas/ruby/parser/gemfile'
require 'belugas/ruby/dispatcher'
require 'rescuer'

module Belugas
  module Ruby
    class Sonar < Thor
      package_name "belugas-ruby"

      desc "analyze --gemfile-path=/app/code", "Ruby feature detection JSON"
      method_option "gemfile-path", type: :string, default: "/code/Gemfile", required: false, aliases: "-p"
      def analyze
        rescuer = Rescuer.new

        begin
          dispatcher = Belugas::Ruby::Dispatcher.new(options["gemfile-path"])
          dispatcher.render
        rescue Exception => e
          rescuer.ping e
          raise e
        end

      end
    end
  end
end

require "belugas/ruby/version"

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "pry"
require "belugas/ruby/standard_names/base"
require "belugas/ruby/parser/gemfile"
require "belugas/ruby/dependency.rb"
require "belugas/ruby/feature/handler"
require "belugas/ruby/feature/builder"
require "belugas/ruby/libraries_collection"
require "belugas/ruby/dispatcher"
require "belugas/ruby"

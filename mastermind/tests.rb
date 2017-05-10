ENV['RACK_ENV'] = 'test'

require './game.rb'
require 'test/unit'
require 'rack/test'
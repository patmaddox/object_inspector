$:.unshift File.dirname(__FILE__)
puts $:
require 'object_inspector/engine' if defined?(Rails)

require 'rubygems/command_manager'
require 'rubygems/command'
require "gem_dump/exporter"


Gem::CommandManager.instance.register_command :dump

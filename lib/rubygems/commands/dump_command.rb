require 'rubygems/command'

class Gem::Commands::DumpCommand < Gem::Command

  def initialize
    super 'dump', 'Dump your file in Gemfile format', :filename => "gem.deps.rb"

    add_option('-f', '--filename FILENAME', 'Dump filename. Default is "gem.deps.rb"') do |value, options|
      options[:filename] = value
    end

  end

  def defaults_str # :nodoc:
    '--filename "gem.deps.rb"'
  end

  def description # :nodoc:
    <<-EOF
Dumps the local installed gems into gemfile format so that it can
later be installed with gem install --file gem.deps.rb
    EOF
  end

  def usage # :nodoc:
    "#{program_name}"
  end

  def execute
    filename = options[:filename]
    GemDump::Exporter.export(filename)
  end

end

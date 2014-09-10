module GemDump

  VERSION = "0.0.1"


  class Exporter

    # List all installed gems


    def self.export(filename, options = {})
      begin
        exporter = new
        result = exporter.export(filename)
      rescue => ex
        raise Gem::Exception, "Ops! An unexpected error occurred: #{ex.message}"
      end

      result
    end

    def installed_gem_names
      @installed_gems ||= get_installed_gems
    end

    def get_installed_gems
      Gem::Specification.map{|s| s.name}.uniq
    end

    def gemified_gem_names
      @gemified_gem_names = installed_gem_names.map{|name| %Q(gem "#{name}")}
    end


    def export(filename = 'gem.deps.rb')
      File.open(filename,'w') do |f|
        gemified_gem_names.each do |line|
          f.puts line
        end
      end
    end



  end


end

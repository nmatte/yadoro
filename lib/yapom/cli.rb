require 'thor'

module Yapom
  class YapomCLI < Thor
    desc "Do the thing"
    long_desc "Does a thing"

    def thing
      puts "o shit whaddup"
    end
  end
end

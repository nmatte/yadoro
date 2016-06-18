require 'thor'
require 'terminal-notifier'
require 'ruby-progressbar'
require_relative 'notifier.rb'
require_relative 'pomo.rb'
require_relative 'configuration.rb'

module Yadoro
  class YadoroCLI < Thor
    desc "Do the thing", "The the thing do the thing"
    long_desc "Does a thing"
    def start(*msg)
      config = Yadoro::Configuration.new(task: msg.join(" "))
      notifier = Yadoro::Notifier.new(config)
      pomo = Yadoro::Pomo.new(config)

      notifier.start_notification
      pomo.do_work

      # notifier.break_notification
      # pomo.do_break
      # notifier.end_notification
    rescue Exception => e
      puts e.message
    end

    desc "saves shit", "shit"
    long_desc "saves whatever shit you want into ~/.yadoro"
    def save(*msg)
      f = File.open(File.expand_path('~/.yadoro'), 'w')
      f.puts(msg.join(" "))
      f.puts({o: "shit waddup", here: "come dat boi"})
      f.close
    end

    default_task :start

    private
  end
end

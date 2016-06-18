require 'thor'
require 'terminal-notifier'
require 'ruby-progressbar'
require 'yaml'
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

      notifier.break_notification
      pomo.do_break

      notifier.end_notification
    rescue Exception => e
      puts e.message
    end

    desc "test save", "test save"
    long_desc "saves whatever thangs you want into ~/.yadoro"
    def save
      f = File.open(File.expand_path('~/.yadoro'), 'w')
      configs = {
        "configs" => [
          {"config_1" => {"work_minutes" => 25, "break_minutes" => 5}},
          {"config_2" => {"work_minutes" => 40, "break_minutes" => 20}}
        ]
      }
      f.puts(configs.to_yaml)
      f.close
    end

    default_task :start

    private
  end
end

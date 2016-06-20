require 'thor'
require 'terminal-notifier'
require 'ruby-progressbar'
require 'yaml'
require_relative 'notifier.rb'
require_relative 'pomo.rb'
require_relative 'configuration.rb'
require_relative 'pomo_runner.rb'

module Yadoro
  class YadoroCLI < Thor
    desc "Runs a timer", "Runs a timer 4 times with the given message"
    def start(*msg)
      config = Yadoro::Configuration.new(task: msg.join(" "))
      runner = PomoRunner.new(config)

      4.times do
        runner.run
      end
    rescue Exception => e
      puts e.message
    end

    desc "Runs a timer once", "Runs a timer once with the given message"
    def one(msg="")
      config = Yadoro::Configuration.new(task: msg)
      runner = PomoRunner.new(config)

      runner.run
    rescue Exception => e
      puts e.message
    end

    desc "Runs a timer", "Runs a timer with the given message, with a work time of 52 min. and break of 17 min."
    def sci(msg="")
      config = Yadoro::Configuration.new(task: msg, work_minutes: 52, break_minutes: 17)
      runner = PomoRunner.new(config)

      loop do
        runner.run
      end
    rescue Exception => e
      puts e.message
    end




    desc "test save", "test save"
    long_desc "feature's in the works--you'll be able to save configurations to ~/.yadoro"
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

    default_task :one

    private
  end
end

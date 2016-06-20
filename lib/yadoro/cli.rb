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
    desc "Runs a timer", "Runs a timer with the given message"
    long_desc "Runs a "
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

    default_task :one

    private
  end
end

require 'thor'
require 'terminal-notifier'
require 'ruby-progressbar'
require_relative 'runner.rb'
module Yadoro
  class YadoroCLI < Thor
    desc "Do the thing", "The the thing do the thing"
    long_desc "Does a thing"

    def start(*msg)
      message = msg.join(" ")
      minutes = 25
      `terminal-notifier -title Pomodoro start -subtitle "#{minutes} minutes remaining" -message "#{message}"`
      prog = ProgressBar.create(
        title: Yadoro.timestamp,
        total: minutes,
        length: minutes + 10,
        format: "%a 🍅  %B ✓"
        )

      minutes.times do
        prog.increment
        sleep 60
      end
      `terminal-notifier -title Pomodoro start -subtitle "5 minutes remaining" -message "#{message}"`
    rescue Interrupt
      puts
    end

    default_task :start
  end

  def self.timestamp
    Time.now.strftime("%H:%M")
  end
end

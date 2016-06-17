require 'thor'
require 'terminal-notifier'
require 'ruby-progressbar'
require_relative 'notification_builder.rb'
module Yadoro
  class YadoroCLI < Thor

    desc "Do the thing", "The the thing do the thing"
    long_desc "Does a thing"
    def start(*msg)
      message = msg.join(" ")
      minutes = 25

      NotificationBuilder.new
        .title("Pomodoro start")
        .subtitle("#{minutes} minutes remaining")
        .has_sound(true)
        .message(message)
        .notify

      t = Thread.new do
        prog = ProgressBar.create(
        title: Yadoro.timestamp,
        total: minutes * 60,
        length: minutes + 10,
        format: "%a 🍅  %B ✓"
        )
        loop do
          prog.increment
          sleep 1
        end
      end

      sleep minutes * 60
      t.kill
      rest_minutes = 5
      rest = ProgressBar.create(
      title: Yadoro.timestamp,
      total: minutes * 60,
      length: minutes + 10,
      format: "%a ✓ %B 🍅"
      )
      NotificationBuilder.new
        .title("Pomodoro start")
        .subtitle("5 minutes remaining")
        .has_sound(true)
        .message(message)
        .notify
      (rest_minutes * 60).times do
        rest.increment
        sleep 1
      end
      `terminal-notifier -title Pomodoro start -subtitle "Pomodoro complete!" -sound default -message "#{message}"`

    rescue Exception
      puts "o shit waddup"
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
  end



  def self.timestamp
    Time.now.strftime("%H:%M")
  end
end

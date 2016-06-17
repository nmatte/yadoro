require 'thor'
require 'terminal-notifier'
require 'ruby-progressbar'
require_relative 'notification_builder.rb'
require_relative 'notification.rb'

module Yadoro
  class YadoroCLI < Thor

    desc "Do the thing", "The the thing do the thing"
    long_desc "Does a thing"
    def start(*msg)
      message = msg.join(" ")
      minutes = 25

      notifier = Yadoro::Notification.new({start_msg: message})
      notifier.start_notification


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
      
      notifier.break_notification
      (rest_minutes * 60).times do
        rest.increment
        sleep 1
      end
      NotificationBuilder.new
        .title("Pomodoro complete!")
        .has_sound(true)
        .notify

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



  def self.timestamp
    Time.now.strftime("%H:%M")
  end
end

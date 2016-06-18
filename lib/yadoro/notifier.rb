require_relative 'notification_builder.rb'

module Yadoro
  class Notifier
    def initialize(config)
      @config = config
    end

    def start_notification
      NotificationBuilder.new
        .title("Pomodoro start")
        .subtitle("#{@config.work_minutes} minutes remaining")
        .has_sound(true)
        .message(@config.task)
        .notify
    end

    def break_notification
      NotificationBuilder.new
        .title("Break start")
        .subtitle("#{@config.break_minutes} remaining")
        .has_sound(true)
        .message(@config.task)
        .notify
    end

    def end_notification
      NotificationBuilder.new
        .title("Pomodoro complete!")
        .has_sound(true)
        .notify
    end
  end
end

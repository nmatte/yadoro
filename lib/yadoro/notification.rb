module Yadoro
  class Notification
    def initialize(config)
      @config = {start: 25, start_msg: "", break: 5}.merge(config)
    end

    def start_notification
      NotificationBuilder.new
        .title("Pomodoro start")
        .subtitle("#{@config[:start]} minutes remaining")
        .has_sound(true)
        .message(@config[:start_msg])
        .notify
    end

    def break_notification
      NotificationBuilder.new
        .title("Break start")
        .subtitle("#{@config[:break]} remaining")
        .has_sound(true)
        .message(@config[:start_msg])
        .notify
    end
  end
end

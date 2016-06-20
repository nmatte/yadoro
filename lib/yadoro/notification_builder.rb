module Yadoro
  class NotificationBuilder
    def initialize
      @commands = {}
    end

    def title(title)
      @commands[:title] = "-title \"#{title}\"" unless title.nil?
      self
    end

    def subtitle(subtitle)
      @commands[:subtitle] = "-subtitle \"#{subtitle}\"" unless subtitle.nil?
      self
    end

    def has_sound(has_sound)
      @commands[:has_sound] = has_sound ? "-sound default" : ""
      self
    end

    def message(message)
      @commands[:message] = "-message \"#{message}\"" unless message.nil?
      self
    end

    def notify
      cmd = "terminal-notifier #{@commands.values.join(" ")}"
      `#{cmd}`
    end
  end
end

module Yadoro
  class NotificationBuilder
    def initialize
      @commands = []
    end

    def title(title)
      @commands << "-title #{title}"
      # @title = title
      self
    end

    def subtitle(subtitle)
      @commands << "-subtitle #{subtitle}"
      # @subtitle = subtitle
      self
    end

    def has_sound(has_sound)
      @commands << "-sound default" if has_sound
      # @has_sound = has_sound
      self
    end

    def message(message)
      @commands << "-message #{message}"
      # @message = message
      self
    end

    def notify
      `#{@commands.join(" ")}`
    end
  end
end

require 'ruby-progressbar'
module Yadoro
  class Pomo
    def initialize(config)
      @config = config
    end
    def do_work
      #   prog = ProgressBar.create(
      #   title: timestamp,
      #   total: minutes * 60,
      #   length: minutes + 10,
      #   format: "%a 🍅  %B ✓"
      #   )

      do_timer(@config.work_seconds)
    end

    def do_break
    end

    def do_timer(seconds_duration)
      clock = Thread.new do
        prog = ProgressBar.create(
          total: seconds_duration,
          format: "%a 🍅  %B  ✓"
        )
        seconds_duration.times {prog.increment; sleep 1}
      end

      sleep seconds_duration
      clock.kill
    end

    def timestamp
      Time.now.strftime("%H:%M")
    end
  end

end

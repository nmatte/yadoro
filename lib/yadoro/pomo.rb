require 'ruby-progressbar'
module Yadoro
  class Pomo
    def initialize(config)
      @config = config
    end

    def do_work
      do_timer(@config.work_seconds, "%a 🍅  %B  ✓")
    end

    def do_break
      do_timer(@config.break_seconds, "%a 🍅  %B  ✓")
    end

    def do_timer(seconds_duration, form)
      clock = Thread.new do
        prog = ProgressBar.create(
          total: seconds_duration,
          length: 50,
          format: form
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

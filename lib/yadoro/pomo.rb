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

      clock = Thread.new do
        prog = ProgressBar.create(
          total: @config.work_seconds,
          format: "%a 🍅  %B  ✓"
        )
        @config.work_seconds.times {prog.increment; sleep 1}
      end

      sleep @config.work_seconds
      clock.kill
    end

    def do_break
    end

    def timestamp
      Time.now.strftime("%H:%M")
    end
  end

end

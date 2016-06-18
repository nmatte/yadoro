require 'ruby-progressbar'
module Yadoro
  class Pomo
    def initialize(config)
      @config = config
    end
    def do_work
      # t = Thread.new do
      #   require 'byebug'; debugger
      #   prog = ProgressBar.create(
      #   title: timestamp,
      #   total: minutes * 60,
      #   length: minutes + 10,
      #   format: "%a 🍅  %B ✓"
      #   )
      #
      #   prog.increment
      #   sleep 1
      # end
      # sleep minutes * 60
      # t.kill

      prog = ProgressBar.create(
      title: "shit",
      format: "%a 🍅  %B ✓"
      )
      20.times {prog.increment; sleep 1}
    end

    def do_break
    end
  end

  def timestamp
    Time.now.strftime("%H:%M")
  end
end

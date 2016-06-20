require_relative 'configuration.rb'
require_relative 'notifier.rb'
require_relative 'pomo.rb'

module Yadoro
  class PomoRunner
    attr_accessor :config

    def initialize(config)
      raise "Invalid config passed to PomoRunner" unless config.is_a?(Configuration)
      @config = config
    end

    def run
      notifier = Yadoro::Notifier.new(@config)
      pomo = Yadoro::Pomo.new(@config)

      notifier.start_notification
      pomo.do_work

      notifier.break_notification
      pomo.do_break

      notifier.end_notification
    end
  end
end

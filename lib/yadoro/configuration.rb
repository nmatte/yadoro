module Yadoro
  class Configuration
    def initialize(options = {})
      @options = {work_minutes: 25, break_minutes: 5, task: ""}.merge(options)
      validate!
    end

    def validate!
      if work_seconds > 60 * 60 * 24
        puts "Warning: a very long duration has been set for work_minutes."
      end
      if break_seconds > 60 * 60 * 24
        puts "Warning: a very long duration has been set for break_seconds."
      end
    end

    def work_minutes
      @options[:work_minutes]
    end

    def work_seconds
      work_minutes * 60
    end

    def break_minutes
      @options[:break_minutes]
    end

    def break_seconds
      break_minutes * 60
    end

    def task
      @options[:task]
    end
  end
end

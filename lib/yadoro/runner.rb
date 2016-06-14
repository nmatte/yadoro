

module Yadoro
  class Runner
    def initialize
      @children = Hash.new
    end

    def every(num)
      RunnerChild.new(num)
    end
  end

  class RunnerChild
    def initialize(num)
      @interval = num
    end

    def minutes(&prc)
      @callback = prc
      @timing = Minutes.new(@interval)
    end

    def seconds(&prc)
      @callback = prc
      @timing = Seconds.new(@interval)
    end
  end

  class Minutes
    attr_reader :val
    def initialize(val)
      @val = val
    end
  end

  class Seconds
    attr_reader :val
    def initialize(val)
      @val = val
    end
  end
end

require "minitest/blink1_reporter/class"
require "blink1"

module Minitest
  class Blink1Reporter
    SUCCESS = [0, 170, 0]
    SKIPPED = [180, 150, 0]
    FAILURE = [180, 0, 0]
    RUNNING = [170, 0, 180]
    FADE = 150

    def initialize(_options)
      @results = []
    end

    def record(result)
      blink1.fade_to_rgb(FADE, *RUNNING)
      @results << result
    end

    def report
      if @results.any?(&:skipped?)
        blink1.fade_to_rgb(FADE, *SKIPPED)
      elsif !@results.all?(&:passed?)
        blink1.fade_to_rgb(FADE, *FAILURE)
      else
        blink1.fade_to_rgb(FADE, *SUCCESS)
      end

      blink1.close
    end

    private

    def blink1
      @blink1 ||= ::Blink1.new.tap(&:open)
    end
  end

  def self.plugin_blink1_reporter_init(options)
    reporter << Blink1Reporter.new(options)
  end
end

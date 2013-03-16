require 'curses'

module Presentator
  class App
    include Curses

    attr_accessor :slides

    def initialize(opts={}, &blk)
      @slides = []
      instance_eval &blk
    end

    def present!
      raise NoContentError if @slides.empty?
      init do
        @slides.each {|s| s.show}
      end
    end

    def slide(&blk)
      @slides << Slide.new(&blk)
    end

  private

    def init(&blk)
      init_screen
      begin
        crmode
        refresh
        yield
        # just before leaving!
        getch
      ensure
        close_screen
      end
    end
  end
end

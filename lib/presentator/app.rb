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
        @slides.each_with_index do |slide, index|
          show_slide_number index
          slide.show
        end
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

    def show_slide_number(id)
      pos = [1, 8, 2, 2]

      win = Window.new(*pos)
      win.setpos(1, 0)
      win.addstr("#{id+1}/#{@slides.length}")
      win.refresh
      win.close
    end
  end
end

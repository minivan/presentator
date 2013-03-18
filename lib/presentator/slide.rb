require 'curses'

module Presentator
  class Slide
    include Curses
    attr_accessor :elements

    def initialize(opts={}, &blk)
      @elements = []
      instance_eval &blk
    end

    def text(message="")
      @elements << message
    end

    def show
      @elements.each_with_index do |element, index|
        show_text element, offset: -index*2
      end
      getch
      clear
      refresh
    end

    private

    def show_text(message, params={})
      offset = params[:offset] || 0
      position = params[:position] || :center

      width = message.length + 6
      pos = [1, width]

      case position
      when :top
        pos += [3, (cols - width)/ 2]
      when :center
        pos += [(lines - offset) / 2, (cols - width) / 2]
      end

      win = Window.new(*pos)
      win.setpos(0, 0)
      win.addstr(message)
      win.refresh
      win.close

      win
    end
  end
end

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
      @elements << Text.new(message)
    end

    def show
      @elements.each_with_index do |element, index|
        element.show offset: -index*2
      end
      getch
      clear
      refresh
    end

    private

  end
end

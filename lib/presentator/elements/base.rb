require 'curses'

module Presentator
  class Base
    include Curses
    attr_accessor :elements

    def initialize(opts = {}, &blk)
      @elements = []
      instance_eval &blk
    end

    def text(message = '', opts = {})
      elements << Text.new(message, opts)
    end

    def list(opts = {}, &blk)
      elements << List.new(opts, &blk)
    end

    def show(opts = {})
      raise NotImplementedError,
            "The container #{self.class.name} has not implemented a show method!"
    end

    def height
      elements.map(&:height).inject(:+)
    end

    def width
      elements.map(&:width).inject(:+)
    end
  end
end

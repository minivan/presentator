
module Presentator
  class Slide
    attr_accessor :elements

    def initialize(opts={}, &blk)
      @elements = []
      instance_eval &blk
    end

    def text(message="")
      @elements << message
    end

    def show
      @elements.each {|e| p e}
    end
  end
end

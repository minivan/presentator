module Presentator
  class App
    attr_accessor :slides

    def initialize(opts={}, &blk)
      @slides = []

      instance_eval &blk
    end

    def present!
      raise NoContentError if @slides.empty?
      @slides.each {|s| s.show}
    end

    def slide(&blk)
      @slides << Slide.new(&blk)
    end

  end

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

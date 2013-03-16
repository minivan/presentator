
module Presentator
  class App
    attr_accessor :slides

    def initialize(opts={}, &blk)
      @slides = []
    end

    def present!
      raise NoContentError if @slides.empty?
    end
  end
end

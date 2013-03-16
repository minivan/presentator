
module Presentator
  class NoContentError < StandardError
    def initialize
      super "The container has no content"
    end
  end
end

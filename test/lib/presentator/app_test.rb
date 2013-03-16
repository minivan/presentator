require_relative '../../test_helper'

describe Presentator::App do
  before do
    @app = Presentator::App.new
  end

  describe "With no slides set" do
    it "should not be able to run" do
      present = -> { @app.present! }
      present.must_raise Presentator::NoContentError
    end
  end
end


require_relative '../../test_helper'

describe Presentator::App do

  describe "With no slides set" do
    before do
      @app = Presentator::App.new
    end

    it "should not be able to run" do
      @app = Presentator::App.new
      present = -> { @app.present! }
      present.must_raise Presentator::NoContentError
    end
  end

  describe "With an added slide" do
    before do
      @app = Presentator::App.new do
        slide do
          text "Hello, world"
        end
      end
    end

    it "must have slides with some content" do
      @app.slides.wont_be_empty
      -> { @app.present }.wont_raise Presentator::NoContentError
    end
  end
end


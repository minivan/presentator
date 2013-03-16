require_relative '../../test_helper'

describe Presentator::App do

  describe "With no slides set" do
    before do
      @app = Presentator::App.new do
      end
    end

    it "should not be able to run" do
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
    end
  end
end


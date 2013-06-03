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
        slide do
          list do
            text 'test'
            text 'test'
          end
        end
      end
    end

    let (:slides) { @app.slides }

    it "must have slides with some content" do
      slides.wont_be_empty
    end

    it 'has a slide that contains only text' do
      slides.first.elements.count.must_equal 1
      slides.first.elements.first.class.must_equal Elements::Text
    end

    it 'has a slide that contains a list' do
      slides[1].elements.count.must_equal 1
    end
  end

end


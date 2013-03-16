require_relative '../../test_helper'

describe Presentator do

  it "Must have a valid version" do
    Presentator::VERSION.wont_be_nil
  end

end

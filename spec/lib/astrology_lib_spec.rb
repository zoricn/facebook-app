require 'spec_helper'
describe AstrologyLib do
  before do
  end

  it "should return sign based on date" do
    AstrologyLib.sign_from_date(3,29).should == "aries"
  end

  it "should convert date and return sign" do
    AstrologyLib.sign_from_date(3,29).should == "aries"
  end


end

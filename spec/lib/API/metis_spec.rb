require 'spec_helper'
describe Metis do
  before do
    @metis = Metis.new
  end


  it "should return number of copies" do
    content = Metis.get_today("Aries", "daily_overview")
    content.should_not be_nil
  end

  pending "test when error response when url is not given"

end

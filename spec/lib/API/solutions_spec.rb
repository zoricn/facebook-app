require 'spec_helper'
describe Solutions do
  before do
    @solutions = Solutions.new
  end


  it "should return number of copies" do
    host = 'http://blog.kolosek.com/hashes-tricks'
    conent = Solutions.get_content("Aries", "daily01overview/dailyoverview")
    conent.should_not be_nil
  end

  pending "test when error response when url is not given"

end

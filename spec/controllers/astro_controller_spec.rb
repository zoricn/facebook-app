require 'spec_helper'

describe AstroController do
  let(:mock_friends)  {[{"name"=>"Nebojsa Zoric", "id"=>"701256955"}, {"name"=>"Marko Orozic", "id"=>"100001803259174"}] }
  let(:mock_horoscopes) {[mock_model(Horoscope)]}
  let(:current_person) {{"id"=>"1506246046", "name"=>"Vladimir Kitic", "first_name"=>"Vladimir", "last_name"=>"Kitic", "link"=>"http://www.facebook.com/profile.php?id=1506246049", "birthday"=>"12/19/1975", "gender"=>"male", "timezone"=>2, "locale"=>"en_US", "verified"=>true, "updated_time"=>"2012-03-28T21:32:08+0000"}}

  describe "GET 'index'" do
    before do
      Horoscope.stub(:all).and_return(mock_horoscopes)
      KoalaService.stub(:get_friends).and_return(mock_friends)
      Koala::Facebook::API.new.stub(:get_object).and_return(current_person)
      controller.stub(:verify_access_token).and_return(true)
      get :index
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign all horoscope types" do
      assigns(:horoscopes).should == mock_horoscopes
    end
    it "should assign friends" do
      pending "Assign friends"
      #assigns(:friends).should be(mock_friends)
    end
  end

end

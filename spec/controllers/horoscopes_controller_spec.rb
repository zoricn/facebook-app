require 'spec_helper'

describe HoroscopesController do
  let(:mock_horoscope) {mock_model(Horoscope)}
  let(:mock_person) {mock_model(Person)}

  before do
    controller.stub(:current_person).and_return(mock_person)
    controller.stub(:graph).and_return({"id"=>"1506246046", "name"=>"Vladimir Kitic", "first_name"=>"Vladimir", "last_name"=>"Kitic", "link"=>"http://www.facebook.com/profile.php?id=1506246049", "birthday"=>"12/19/1975", "gender"=>"male", "timezone"=>2, "locale"=>"en_US", "verified"=>true, "updated_time"=>"2012-03-28T21:32:08+0000"})
    controller.stub(:verify_access_token).and_return(true)
  end

  describe "GET 'show'" do
    before do
      Horoscope.stub(:find).with('13').and_return(mock_horoscope)
      Solutions.stub(:get_content).and_return("Something")
      get 'show', :id => '13'
    end

    it "returns http success" do
      response.should be_success
    end

    it "should get conent from solutions" do
      #Solutions.should_receive(:get_content)
    end

    it "shouls assign conent" do
      assigns(:content).should == "Something"
    end
  end

  describe "PUT publish" do
    before do
      Horoscope.stub(:find).with('13').and_return(mock_horoscope)
      KoalaService.stub(:post_on_my_wall).and_return(true)
      put :publish, :id => '13'
    end

    it "publishes via koala gem to facebook" do
      KoalaService.should_receive(:post_on_my_wall)
    end

  end

  describe "PUT share" do
    before do
      Horoscope.stub(:find).with('13').and_return(mock_horoscope)
      KoalaService.stub(:share).and_return(true)
      put :share, :id => '13'
    end

    it "publishes via koala gem to facebook" do
      KoalaService.should_receive(:share)
    end

  end

  describe "PUT like" do
    before do
      Horoscope.stub(:find).with('13').and_return(mock_horoscope)
      KoalaService.stub(:like).and_return(true)
      put :like, :id => '13'
    end

    it "publishes via koala gem to facebook" do
      KoalaService.should_receive(:like)
    end

  end
end

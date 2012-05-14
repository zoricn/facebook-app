require 'spec_helper'

describe FacebookController do

  describe "GET 'auth'" do
    it "should be successful" do
      get :auth
      response.should be_success
    end
  end

  describe "GET 'close'" do
    it "should be successful" do
      get :close
      response.should be_success
    end
  end

  describe "GET 'callback'" do
    it "should be successful" do
      get :callback
      response.should be_success
    end
  end

end

class HoroscopesController < ApplicationController
  before_filter :verify_access_token, :except => [:show]
  #before_filter :check_if_user_has_fb_account, :only => [:publish, :share]
  before_filter :get_horoscope

  def show
    @content = Metis.get_today(current_person.sign, @horoscope.solutions_feed)
    session[:horoscope_content] = @content
  end

  def publish
    begin
      KoalaService.post_on_my_wall(@graph, session[:horoscope_content])
    rescue Exception => e
      puts 'Exception when publishing content'
    end
    respond_to do |format|
      format.js { render :layout => false }
      format.html { render :layout => false }
    end
  end

  def share
    begin
      KoalaService.post_on_friends_wall(@graph, session[:horoscope_content], params[:uid])
    rescue Exception => e
    	puts 'Exception when sharing content'
    end
  end


  private

  def get_horoscope
    @horoscope = Horoscope.find params[:id]
  end

  def check_if_user_has_fb_account
    @can_post_to_fb = true if @graph
  end
end

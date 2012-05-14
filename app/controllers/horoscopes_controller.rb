class HoroscopesController < ApplicationController
  before_filter :verify_access_token, :except => [:show]
  before_filter :check_if_user_has_fb_account, :only => [:publish, :share, :like]
  before_filter :get_horoscope

  def show
    @content = Solutions.get_content(current_person.sign, @horoscope.solutions_feed)
  end

  def publish
    #KoalaService.post_on_my_wall(@graph, "I like this horoscope")
    respond_to do |format|
		  format.js { render :layout => false }
		  format.html { render :layout => false }
		end
  end

  def share
    KoalaService.post_on_friends_wall(@graph, params[:uid])
  end


  private

  def get_horoscope
    @horoscope = Horoscope.find params[:id]
  end

  def check_if_user_has_fb_account
    @can_post_to_fb = true if @graph
  end
end

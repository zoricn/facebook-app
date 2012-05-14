class AstroController < ApplicationController
  before_filter :verify_access_token, :only => [:index, :like]

  def index
    @horoscopes = Horoscope.all
    begin
      @friends = KoalaService.get_friends(@graph)
    rescue Koala::Facebook::APIError
      logger.info "Koala API error"
    end
  end

  def like
    KoalaService.like!(@graph)
  end

end

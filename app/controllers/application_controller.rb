class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_person
  #TODO Handle errors for applications
  # Koala::Facebook::APIError
  # Koala::Facebook::APIError (OAuthException: (#506) Duplicate status message)

  def current_person
    @current_person ||= Person.find_by_uid(session[:current_uid])
  end

  private

    def request_authorization
      # FB doesn't like port numbers in the return URL in canvas apps
      full_host = request.host
      full_host += ':' + request.port.to_s if request.host == 'localhost'
      return_url = "#{request.protocol}#{full_host}#{request.fullpath}"
      logger.info 'FB Auth Return URL: ' + return_url
      session['oauth'] = Koala::Facebook::OAuth.new(ENV['ASTRO_FACEBOOK_APP_ID'], ENV['ASTRO_FACEBOOK_APP_SECRET'], return_url)
      redirect_to session['oauth'].url_for_oauth_code(:permissions => 'user_birthday,friends_birthday,publish_actions,publish_stream,read_stream')
    end

    def verify_access_token
      unless session['access_token']
        if session['oauth'] && params[:code]
          # Use the code returned by Facebook to get an access token
          session['access_token'] = session['oauth'].get_access_token(params[:code])
        else
          # Coming in cold so ask for auth
          request_authorization && return
        end
      end

      @graph = Koala::Facebook::API.new(session['access_token'])

      # Need to get an actual object to test the access token
      @current_graph = @graph.get_object("me")
      session['current_uid'] = @current_graph['id']
   
      unless Person.find_by_uid(@current_graph['id'])
        sign = @current_graph['birthday'].nil? ? 'Aries' : return_sign(@current_graph['birthday']) 
        Person.create!(:uid => @current_graph['id'], :sign => sign )
      end
          
      
    rescue Koala::Facebook::APIError
      session['access_token'] = nil
      request_authorization
    end

    def return_sign(birthday)    
		  birthday += "/2012" if birthday.count("/") == 1
		  birthday = Date.strptime(birthday, "%m/%d/%Y")
		  month = birthday.strftime("%m").to_i
		  day = birthday.strftime("%d").to_i
		  AstrologyLib.sign_from_date(month,day).try(:capitalize)
    end

end

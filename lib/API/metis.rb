require 'net/http'
require 'uri'
require 'open-uri'
require 'httparty'


class Metis

    def self.get_today(sign, content_type, options = {})
       date = Time.now.strftime("%m/%d/%Y")
       sign = sign.downcase
       content_type ||= "daily_overview"
       url = "http://content.astrology.com/api/content_items.json?key=aa8c2e6327297b28e51728f332326bad251c4cc2&date=05%2F15%2F2012&content_type=#{content_type}&localization=none"
      party_response = HTTParty.get(url)

      body = JSON.parse(party_response.body)
      body.each{|r| @content = r['body'] if r['sign'] == sign}
      @content
    end

end

require 'net/http'
require 'uri'
require 'open-uri'
require 'nokogiri'

class Solutions

  def self.get_content(sign, feed)
    begin
      @doc = Nokogiri::XML(open("http://solutions.astrology.com/scripts/it.dll?cust_id=ac74nn&doc=#{feed}.xml"))
    rescue
      puts "Solutions Error #{$!}"
    end

    unless @doc.nil?
         today = Date.today.strftime("%m/%d/%Y")
         (@doc/:Record).each{|r| @content = (r/sign.capitalize.to_sym) if (r/:Date).inner_html == today}
         puts @content.inner_html
         @content.inner_html
    end
  end

end

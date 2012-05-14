class Horoscope < ActiveRecord::Base
  WESTERN_SIGNS = ['aries', 'taurus', 'gemini', 'cancer', 'leo', 'virgo', 'libra', 'scorpio', 'sagittarius', 'capricorn', 'aquarius', 'pisces']
  attr_accessible :name, :solutions_feed
end

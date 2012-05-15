# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Horoscope.delete_all
Horoscope.create!(:name => "Daily overview", :solutions_feed => 'daily_overview')
Horoscope.create!(:name => "Daily Astro Slam", :solutions_feed => 'daily_astro_slam')
Horoscope.create!(:name => "Daily home garden", :solutions_feed => 'daily_home_and_garden')

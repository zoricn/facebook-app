module KoalaService
  def self.graph_from(token)
    Koala::Facebook::API.new(token)
  end

  def self.get_me(graph)
  	graph.get_object("me")
  end

  def self.get_twenty_friends(graph)
    friends = graph.get_connections("me", "friends", :fields => "birthday,name")
    return friends.sort! { |a,b| a["name"].downcase <=> b["name"].downcase }.first 20 || []
  end

  def self.get_friends(graph)
    graph.get_connections("me", "friends", :fields => "name")
  end

  def self.post_on_my_wall(graph, msg, options = {})
    graph.put_wall_post(msg)
  end

  def self.post_on_friends_wall(graph, friends_uid)
    graph.put_wall_post("Hey. Take a look at Astrology App!", {:name => "SomeName"}, friends_uid) 
  end

  #ENV variable is unique facebook application id
  def self.like!(graph)
debugger
    graph.put_like(ENV['ASTRO_FACEBOOK_ID'])
  end

  def self.post_day_wall(graph, msg, link = '', options = {})
    if options[:name] && options[:horoscope]
      msg = "#{name} read #{horoscope} #{msg}"
    end

    graph.put_wall_post(msg)
  end

  

end

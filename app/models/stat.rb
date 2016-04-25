class Stat < ActiveRecord::Base
  
  belongs_to :user

  def searchForStats(uri, id)

    doc = Nokogiri::HTML(open(uri.to_s))

    items = doc.xpath("//tr[starts-with(@id,'batting_standard')]").collect {|node| node.text.strip}

    items.each{|i|
      
      t = i.split("\n")
      stats = Stat.new
      year = t[0]
      stats.year = year[0,4].to_i
      stats.age = t[1].delete(" ").to_i 
      stats.team = t[2].delete(" ")
      stats.lg = t[3].delete(" ")
      stats.games = t[4].delete(" ").to_i 
      stats.pa = t[5].delete(" ").to_i 
      stats.ab = t[6].delete(" ").to_i 
      stats.r = t[7].delete(" ").to_i 
      stats.h = t[8].delete(" ").to_i 
      stats.second_base = t[9].delete(" ").to_i 
      stats.third_base = t[10].delete(" ").to_i 
      stats.hr = t[11].delete(" ").to_i
      stats.rbi = t[12].delete(" ").to_i
      stats.sb = t[13].delete(" ").to_i
      stats.cs = t[14].delete(" ").to_i  
      stats.bb = t[15].delete(" ").to_i  
      stats.so = t[16].delete(" ").to_i  
      stats.ba = t[17].delete(" ").to_f
      stats.obp = t[18].delete(" ").to_f  
      stats.slg = t[19].delete(" ").to_f 
      stats.ops = t[20].delete(" ").to_f  
      stats.player_id = id.to_i
      stats.save
    }

  end

end
class Stat < ActiveRecord::Base
  
  belongs_to :user

  def totalstats(id)

    s = Stat.where(player_id: id)

    games = pa = ab = r = h = second_base = third_base = hr = rbi = sb = cs = bb = so = 0
    first = 0
    hbp = sh = sf = 0

    s.each {|stat|
      games += stat.games
      pa += stat.pa
      ab += stat.ab
      r += stat.r
      h += stat.h
      second_base += stat.second_base
      third_base += stat.third_base
      hr += stat.hr
      rbi += stat.rbi
      sb += stat.sb
      cs += stat.cs 
      bb += stat.bb 
      so += stat.so
      hbp += stat.hbp
      sh += stat.sh
      sf += stat.sf

    }

    stats = Stat.new

    stats.year = "Total"

    stats.games = games
    stats.pa = pa
    stats.ab = ab
    stats.r = r
    stats.h = h
    stats.second_base = second_base
    stats.third_base = third_base
    stats.hr = hr
    stats.rbi = rbi
    stats.sb = sb
    stats.cs = cs 
    stats.bb = bb 
    stats.so = so
    stats.hbp = hbp
    stats.sh = sh
    stats.sf = sf

    first += (h - second_base - third_base - hr)

    stats.ba = h.to_f/ab.to_f
    stats.obp = (h + bb + hbp).to_f / (ab + bb + hbp + sf).to_f
    stats.slg = ((first) + (2 * second_base) + (3 * third_base) + (4 * hr)).to_f / ab.to_f
    stats.ops = stats.obp + stats.slg

    stats.player_id = id.to_i
    
    stats.save

  end

  def searchForStats(uri, id)

    doc = Nokogiri::HTML(open(uri.to_s))

    items = doc.xpath("//tr[starts-with(@id,'batting_standard')]").collect {|node| node.text.strip}

    items.each{|i|
      
      t = i.split("\n")
      stats = Stat.new
      year = t[0]
      stats.year = year[0,4].to_s
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

      stats.hbp = t[24].delete(" ").to_i
      stats.sh = t[25].delete(" ").to_i
      begin  
        stats.sf = t[26].delete(" ").to_i
      rescue
        puts "OH NO"
        stats.sf = 0
      end

      stats.player_id = id.to_i
      stats.save

    }


    totalstats(id)

  end

end
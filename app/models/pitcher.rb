class Pitcher < ActiveRecord::Base

  belongs_to :player

  def pitcherTotalstats(id)

    s = Pitcher.where(player_id: id)

    games = w = l = gs = gf = cg = sho = sv = h = r = er = bb = so = 0
    hr = hbp = bk = wp = bf = ip = ip_h = 0
   

    s.each {|stat|
      
      games += stat.games
      w += stat.w
      l += stat.l
      gs += stat.gs
      gf += stat.gf
      h += stat.h
      hr += stat.hr
      bk += stat.bk
      sho += stat.sho
      er += stat.er
      sv += stat.sv 
      so += stat.so
      hbp += stat.hbp
      wp += stat.wp
      cg += stat.cg
      temp = stat.ip.to_s.split(".")
      ip += temp[0].to_i
      ip_h += temp[1].to_i
      bb += stat.bb
      r += stat.r

    }

    stats = Pitcher.new

    stats.year = "Total"

    stats.games = games
    stats.w = w
    stats.l = l
    stats.wl = w.to_f/(w+l).to_f
    stats.h = h
    
    stats.sho = sho
    stats.hr = hr
    stats.ip = ip
    puts stats.ip
    stats.ip += ((ip_h/3).to_i).to_f

    puts stats.ip
    stats.ip += (ip_h.modulo(3).to_f / 10.0).to_f
  
    puts stats.ip
    stats.era = (9 * er)/ stats.ip
    stats.r = r
    stats.er = er 
    stats.bb = bb 
    stats.so = so
    stats.hbp = hbp
    stats.bk = bk
    stats.sv = sv
    stats.gs = gs
    stats.gf = gf
    stats.cg = cg
    stats.wp = wp
    stats.whip = (bb + h)/stats.ip

    stats.player_id = id.to_i

    stats.save

  end

  def stats(doc, id)

    items = doc.xpath("//tr[starts-with(@id,'pitching_standard')]").collect {|node| node.text.strip}

    items.each{|i|
      
      t = i.split("\n")
      stats = Pitcher.new
      year = t[0]
      stats.year = year[0,4].to_s
      stats.age = t[1].delete(" ").to_i 
      stats.team = t[2].delete(" ")
      stats.lg = t[3].delete(" ")
      stats.w = t[4].delete(" ").to_i 
      stats.l = t[5].delete(" ").to_i 
      stats.wl = t[6].delete(" ").to_f
      stats.era = t[7].delete(" ").to_f
      stats.games = t[8].delete(" ").to_i 
      stats.gs = t[9].delete(" ").to_i 
      stats.gf = t[10].delete(" ").to_i 
      stats.cg = t[11].delete(" ").to_i
      stats.sho = t[12].delete(" ").to_i
      stats.sv = t[13].delete(" ").to_i
      stats.ip = t[14].delete(" ").to_f  
      stats.h = t[15].delete(" ").to_i  
      stats.r = t[16].delete(" ").to_i  
      stats.er = t[17].delete(" ").to_i
      stats.hr = t[18].delete(" ").to_i  
      stats.bb = t[19].delete(" ").to_i 
      stats.so = t[21].delete(" ").to_i
      stats.hbp = t[22].delete(" ").to_i
      stats.bk = t[23].delete(" ").to_i
      stats.wp = t[24].delete(" ").to_i
      stats.whip = t[28].delete(" ").to_f

      stats.player_id = id.to_i
      stats.save

    } 

    pitcherTotalstats(id)
  
  end

  def updateStats(player)

    doc = Nokogiri::HTML(open(player.url))

    items = doc.xpath("//tr[starts-with(@id,'pitching_standard.2016')]").collect {|node| node.text.strip}

    items.each{|i|
      
      t = i.split("\n")
      
      stats = Pitcher.where(year: "2016").where(player_id: player.id)[0]
      if stats.nil?
        return
      end
      stats.destroy
      
      stats = Pitcher.new

      year = t[0]
      stats.year = year[0,4].to_s
      stats.age = t[1].delete(" ").to_i 
      stats.team = t[2].delete(" ")
      stats.lg = t[3].delete(" ")
      stats.w = t[4].delete(" ").to_i 
      stats.l = t[5].delete(" ").to_i 
      stats.wl = t[6].delete(" ").to_f
      stats.era = t[7].delete(" ").to_f
      stats.games = t[8].delete(" ").to_i 
      stats.gs = t[9].delete(" ").to_i 
      stats.gf = t[10].delete(" ").to_i 
      stats.cg = t[11].delete(" ").to_i
      stats.sho = t[12].delete(" ").to_i
      stats.sv = t[13].delete(" ").to_i
      stats.ip = t[14].delete(" ").to_f  
      stats.h = t[15].delete(" ").to_i  
      stats.r = t[16].delete(" ").to_i  
      stats.er = t[17].delete(" ").to_i
      stats.hr = t[18].delete(" ").to_i  
      stats.bb = t[19].delete(" ").to_i 
      stats.so = t[21].delete(" ").to_i
      stats.hbp = t[22].delete(" ").to_i
      stats.bk = t[23].delete(" ").to_i
      stats.wp = t[24].delete(" ").to_i
      stats.whip = t[28].delete(" ").to_f

      stats.player_id = player.id.to_i
      stats.save

    } 

    pitcherTotalstats(player.id)

  end

end
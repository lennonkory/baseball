class Search

  def searchByUrl(url)

    doc = Nokogiri::HTML(open(url.to_s))

    items = doc.css('img.border').map{|link| link['src']}
    picture = items[0].to_s

  end

  def searchForPlayer(name)

    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    a.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    page = a.get 'http://www.baseball-reference.com//'
    search_form = page.form_with :name => "f"

    search_form.field_with(:name => "search").value = name

    search_results = search_form.submit

    uri = search_results.uri

    #more than one player was found
    if uri.to_s.include? "search"

      doc = Nokogiri::HTML(open(uri))
   
      l = doc.css('div.search-item-name a').map { |link| link }

      id_list = Array.new

      l.each{|i|

        link = i['href']
        if link.include? "player" and link.include? "shtml" 
          ref = "http://www.baseball-reference.com/" + link
          pos = doc.xpath("//span[contains(@itemprop,'role')]").text.strip
          names = i.text.strip.to_s.split("\n")[0]
          names = names.split(' ')
          p = Player.new(firstname: names[0], lastname: names[1], url: ref , picture: searchByUrl(ref), position: pos)
          p.save
          if pos == "Pitcher"
            Pitcher.new.stats(doc, p.id)
          else
            Batter.new.stats(doc, p.id)
          end
          id_list.push(p.id)
        end
        
      }

      return id_list

    end

    if uri == "http://www.baseball-reference.com"
      return nil
    end

    doc = Nokogiri::HTML(open(uri.to_s))

    items = doc.css('img.border').map{|link| link['src']}
    picture = items[0].to_s

    pos = doc.xpath("//span[contains(@itemprop,'role')]").text.strip

    names = name.split(" ")
    p = Player.new(firstname: names[0].capitalize, lastname: names[1].capitalize, url: uri.to_s , picture: picture, position: pos)
    p.save
    
    if pos == "Pitcher"
      Pitcher.new.stats(doc, p.id)
    else
      Batter.new.stats(doc, p.id)
    end
    
    return p.id

  end

end
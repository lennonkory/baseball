class Search

  def searchByUrl(url)

    doc = Nokogiri::HTML(open('http://www.baseball-reference.com/'+url.to_s))

    items = doc.css('img.border').map{|link| link['src']}
    picture = items[0].to_s

  end

  def searchForPlayer(name)

    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    a.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #page = a.get 'http://mlb.mlb.com/mlb/players/?tcid=mm_mlb_players/'
    #search_form = page.form_with :name => "searchforplayer1"
    #search_form.field_with(:name => "q").value = "Bautista"

    page = a.get 'http://www.baseball-reference.com//'
    search_form = page.form_with :name => "f"

    search_form.field_with(:name => "search").value = name

    search_results = search_form.submit

    uri = search_results.uri

    puts "URI"
    puts uri.to_s
    puts "URI"

    if uri.to_s.include? "search"
      puts "SEARCHING"
      doc = Nokogiri::HTML(open(uri))
   
      l = doc.css('div.search-item-name a').map { |link| link }

      dic = Hash.new

      l.each{|i|
        link = i['href']
        if link.include? "player" and link.include? "shtml" 
          puts link
          keys = i.text.strip.to_s.split("\n")
          key = keys[0] + " " + keys[1].delete("\t")
          dic[key] = link

        end
        
      }
      puts "END"
      return dic

    end

    if uri == "http://www.baseball-reference.com"
      return nil
    end

    doc = Nokogiri::HTML(open(uri.to_s))

    items = doc.css('img.border').map{|link| link['src']}
    picture = items[0].to_s
  end
end
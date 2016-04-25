class HomeController < ApplicationController
  
  def home
  end
  
  def search
    puts "^^^^^^^^^^^^^^^^^^"
    p = Search.new.searchForPlayer(params[:name])
    if p
      #redirect_to show_player(@player)
    else

    end

  end

end
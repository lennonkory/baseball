class PlayerController < ApplicationController

	def new
		@player = Player.new
	end

	def create

		p = Player.where(name: params[:name])

		if p.length == 1
			redirect_to player_path(p[0])
		elsif p.length > 1
			p.each{|i| puts i.name}
	    	redirect_to action: "index", name: params[:name]
	    else
	    	
	    	p = Search.new.searchForPlayer(params[:name])

			if p.is_a?(String)
				@player = Player.new(name: params[:name], picture: p)
				@player.save
				redirect_to player_path(@player)	
			else
				s = Search.new
				p.each{|k,v|
					pic = s.searchByUrl(v)
					info = k.split(" ")
					@player = Player.new(name: info[0] + " " + info[1], picture: pic)
					@player.save
				}
				redirect_to action: "index", name: params[:name]
			end
			
		end

	end

	def show
		@player = Player.find(params[:id])
	end

	def index

		@players = Player.where(name: params[:name])

	end

end
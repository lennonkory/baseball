class PlayerController < ApplicationController

	def new
		@player = Player.new
	end

	def create

		names = params[:name].split(" ")

		players = Player.where(firstname: names[0].capitalize).where(lastname: names[1].capitalize)

		if players.length == 1
			redirect_to player_path(players[0])
		elsif players.length > 1
	    	redirect_to action: "index", name: params[:name]
	    else
	    	
	    	p_ids = Search.new.searchForPlayer(params[:name])

			if p_ids.is_a?(Integer)
				@player = Player.find(p_ids)
				redirect_to player_path(@player)	
			else
				redirect_to action: "index", id: p_ids
			end
			
		end

	end

	def show
		@player = Player.find(params[:id])
	end

	def index

		if params[:name]
			names = params[:name].split(" ")
			@players = Player.where(firstname: names[0].capitalize).where(lastname: names[1].capitalize)
		else
			@players = Player.where(id: params[:id])
		end

	end

end
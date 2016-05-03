class PlayerController < ApplicationController

	def new
		@player = Player.new
	end

	def create

		names = params[:name].split(" ")

		players = []

		if names.length != 1
			players = Player.where(firstname: names[0].capitalize).where(lastname: names[1].capitalize)
		end 

		#one player was found in ddatabase
		if players.length == 1
			Search.new.updateStats(players[0])
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
			Search.new.updateStats(@players)
		else
			@players = Player.where(id: params[:id])
			Search.new.updateStats(@players)
		end

	end

	def favourite
		
		id = params[:player_id]
		@player = Player.find(id)

		b = Favourite.where(user_id: current_user.id).find_by(player_id: id)

		if b.nil?

			f = Favourite.new(user_id: current_user.id, player_id: id)

			if f.save
				puts "Saved"
				puts id
			end
		else
			b.destroy
		end

		redirect_to user_path(current_user)

	end

end
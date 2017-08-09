class CardsController < ApplicationController
	layout 'cards' #/RailsApp/app/views/layouts/cards.html.erb


	def index
		@cards = Card.all
	end


	def show
		@card = Card.find(params[:id])
	end


	def add
		if request.post? then
			Card.create(card_params)
			goback
		else
			@card = Card.new #add.html.erbの@cardへ
		end
	end


	def edit
		@card = Card.find(params[:id]) #現在値、edit.html.erbの@cardへ
		if request.patch? then
			@card.update(card_params) #入力値
			goback
		end
	end


	def delete
		Card.find(params[:id]).destroy
		goback
	end


	private
	def card_params
		params.require(:card).permit(:title, :author, :price, :publisher, :memo) #:cardはaddメソッドのCard.new
	end


	private
	def goback
		redirect_to '/cards'
	end


end

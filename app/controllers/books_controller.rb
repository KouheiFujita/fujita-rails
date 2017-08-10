class BooksController < ApplicationController
    layout 'books' #/RailsApp/app/views/layouts/books.html.erb
    
    def index
        @books = Book.all
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def add
        if request.post? then
            Book.create(book_params)
            goback
        else
            @book = Book.new
        end
    end
    
    def edit
        @book = Book.find(params[:id])
		if request.patch? then
			@book.update(book_params)
			goback
		end
    end
    
	def delete
		Book.find(params[:id]).destroy
		goback
	end

    
	private
	def book_params
		params.require(:book).permit(:title, :author, :price, :publisher, :memo) 
	end


	private
	def goback
		redirect_to '/books'
	end
end

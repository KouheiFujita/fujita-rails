class PeopleController < ApplicationController
    layout 'people'
  
    def index
        @msg = 'Person data.'
        @data = Person.all #select * from peopleと同じ、Personクラスはモデル内
    end
    
    def show
        @msg = 'Index data.'
        @data = Person.find(params[:id]) #findメソッドはidのみ
    end
    
    def add
    	@msg = "add new data."
    	@person = Person.new
    end
    
    def create
    	if request.post? then
    	    Person.create(person_params)
    	end
    	redirect_to '/people'
    end
    
    def edit
        @msg = "edit data.[id = " + params[:id] + "]"
        @person = Person.find(params[:id])
    end
    
    def update
        obj = Person.find(params[:id]) #:id→dbからの情報
        obj.update(person_params) #person_params→画面からの情報
        redirect_to '/people'
    end
    
    def delete
        obj = Person.find(params[:id])
        obj.destroy
        redirect_to '/people'
    end
    
    def find
    	@msg = 'please type search word...'
    	@people = Array.new
    	if request.post? then
    		f = params[:find].split(',')
		    @people = Person.find(f)
    	end
    end


    
    private
    def person_params
        params.require(:person).permit(:name, :age, :mail) #requireはparamsの中に指定の値があるかチェック
    end
end

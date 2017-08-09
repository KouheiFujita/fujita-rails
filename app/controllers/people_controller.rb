class PeopleController < ApplicationController
  
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
    
    private
    def person_params
        params.require(:person).permit(:name, :age, :mail) #requireはparamsの中に指定の値があるか
    end
end

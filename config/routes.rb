Rails.application.routes.draw do
    get 'messages/index'
    get 'messages', to: 'messages#index'
    
    get 'messages/add'
    post 'messages/add', to: 'messages#create'
    
    get 'messages/edit/:id', to: 'messages#edit'
    patch 'messages/edit/:id', to: 'messages#update'
    
    get 'messages/delete/:id', to: 'messages#delete'
    
    get 'messages/:id', to: 'messages#show'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get 'people/find'
    post 'people/find'

    
    get 'books/index'
    get 'books', to: 'books#index'
    
    get 'books/add'
    post 'books/add'
    
    get 'books/:id', to: 'books#show'
    
    get 'books/edit/:id', to: 'books#edit'
    patch 'books/edit/:id', to: 'books#edit'
    
    get 'books/delete/:id', to: 'books#delete'


    get 'cards/index'
    get 'cards', to: 'cards#index'
    
    get 'cards/add'
    post 'cards/add'
    
    get 'cards/:id', to: 'cards#show'
    
    get 'cards/edit/:id', to: 'cards#edit'
    patch 'cards/edit/:id', to: 'cards#edit'
    
    get 'cards/delete/:id', to: 'cards#delete'


    get 'people/index'
    get 'people', to: 'people#index'
    get 'people/add' #:idよりも前に記述
    post 'people/add', to: 'people#create'
    get 'people/:id', to: 'people#show' #:idは任意の値
    get 'people/edit/:id', to: 'people#edit'
    patch 'people/edit/:id', to: 'people#update'
    get 'people/delete/:id', to: 'people#delete'

    get 'dengonban', to: 'dengonban#index'
    post 'dengonban', to: 'dengonban#index'
    get 'dengonban/index'
    post 'dengonban/index'

    get 'helo/index'
    get 'helo', to: 'helo#index'

    get 'helo/other'
    
    post 'helo', to: 'helo#index'
    post 'helo/index'
end

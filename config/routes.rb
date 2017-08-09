Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'people/index'
    get 'people', to: 'people#index'
    get 'people/add' #:idよりも前に記述
    post 'people/add', to: 'people#create'
    get 'people/:id', to: 'people#show' #:idは任意の値


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

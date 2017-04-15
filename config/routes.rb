Rails.application.routes.draw do

root to: 'users#index'
get '/users/new', to: 'users#new', as: :signup
post '/users', to: 'users#create'
get '/users/:id', to: 'users#show', as: :user
get '/users/:id/edit', to: 'users#edit', as: :edit
patch 'users/:id', to: 'users#update'

get '/signin', to: 'sessions#new', as: :login
post '/sessions', to: 'sessions#create'
get '/sessions/logout', to: 'sessions#delete', as: :logout


get '/attractions', to: 'attractions#index', as: :attractions
get '/attractions/new', to: 'attractions#new', as: :create_ride
post '/attractions', to: 'attractions#create'
get '/attractions/:id', to: 'attractions#show', as: :ride
get '/attractions/:id/edit', to: 'attractions#edit', as: :edit_ride
patch '/attractions/:id', to: 'attractions#update', as: :update_ride

end

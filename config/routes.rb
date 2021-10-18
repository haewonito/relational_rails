Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/adk_mountains', to: 'adk_mountains#names'
  get '/adk_mountains/:id', to: 'adk_mountains#table'

  get '/artists', to: 'artists#index'

  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'

  get '/artists/:id', to: 'artists#show'

  get '/artists/:id/edit', to: 'artists#edit'
  patch 'artists/:id', to: 'artists#update'


  get '/records', to: 'records#index'
  get '/records/:id', to: 'records#show'

  get '/artists/:id/records', to: 'artists#records'







end

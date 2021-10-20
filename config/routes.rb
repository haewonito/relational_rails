Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/adk_mountains', to: 'adk_mountains#index'
  get '/adk_mountains/new', to: 'adk_mountains#new'
  post '/adk_mountains', to: 'adk_mountains#create'
  get '/adk_mountains/:id', to: 'adk_mountains#show'
  get '/hikers/:id', to: 'hikers#show'
  get '/hikers', to: 'hikers#index'
  get '/adk_mountains/:id/edit', to: 'adk_mountains#edit'
  patch '/adk_mountains/:id/edit', to: 'adk_mountains#update'
  get '/adk_mountains/:id/hikers', to: 'adk_mountains#hikers_by_mountain'
  get '/adk_mountains/:id/hikers/new', to: 'adk_mountains#new_hiker'
  post '/adk_mountains/:id/hikers/new', to: 'adk_mountains#create_hiker'
  get '/hikers/:id/edit', to: 'hikers#edit'
  patch '/hikers/:id/edit', to: 'hikers#update'
  delete '/adk_mountains/:id', to: 'adk_mountains#destroy'
  delete '/hikers/:id', to: 'hikers#destroy'
  delete '/adk_mountains/:id/hikers', to: 'hikers#destroy'

  get '/artists', to: 'artists#index'

  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'

  get '/artists/:id', to: 'artists#show'

  get '/artists/:id/edit', to: 'artists#edit'
  patch 'artists/:id', to: 'artists#update'


  get '/records', to: 'records#index'
  get '/records/:id', to: 'records#show'

  get '/artists/:id/records', to: 'artists#records'

  get '/records/:id/edit', to: 'records#edit'
  patch '/records/:id', to: 'records#update'

  delete '/artists/:id', to: 'artists#destroy'
  delete '/records/:id', to: 'records#destroy'






end

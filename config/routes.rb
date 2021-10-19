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
  get '/artists', to: 'artists#index'
  # get '/artists/:id', to: 'artists'
  get '/artists/:id', to: 'artists#show'
  # :id is a domain-specific language DSL
end

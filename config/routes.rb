Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/adk_mountains', to: 'adk_mountains#names'
  get '/adk_mountains/:id', to: 'adk_mountains#table'
  get '/hikers/:id', to: 'hikers#by_id'
  get '/hikers', to: 'hikers#table'
  get '/adk_mountains/:id/hikers', to: 'adk_mountains#hikers_by_mountain'
  get '/artists', to: 'artists#index'
  # get '/artists/:id', to: 'artists'
  get '/artists/:id', to: 'artists#show'
  # :id is a domain-specific language DSL
end

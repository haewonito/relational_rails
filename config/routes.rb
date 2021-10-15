Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artists', to: 'artists#index'
  # get '/artists/:id', to: 'artists'
  get '/artists/:id', to: 'artists#show'
  # :id is a domain-specific language DSL
end

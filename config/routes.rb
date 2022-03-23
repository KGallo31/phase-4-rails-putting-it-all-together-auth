Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show'
  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create'
end

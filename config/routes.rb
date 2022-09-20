Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dish, only: [:show]
  resources :chef, only: [:show]

  get '/chefs/:id/ingredients/', to: 'chef_ingredients#index'
end

Rails.application.routes.draw do

  get 'lines/show'

  resources :scenes, only: [:index, :show]
  resources :lines, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

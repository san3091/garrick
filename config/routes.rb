Rails.application.routes.draw do

  get 'speeches/show'

  get 'lines/show'

  resources :scenes, only: [:index, :show]
  resources :lines, only: [:show]

  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images, only: [:new, :create, :index]
  resources :plays, only: [:create, :index]
  root 'images#new'
end

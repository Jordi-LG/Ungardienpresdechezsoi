Rails.application.routes.draw do
  devise_for :petsitters
  devise_for :petowners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :associations, only: [:show]
end

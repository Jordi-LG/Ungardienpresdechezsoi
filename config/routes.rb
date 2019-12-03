Rails.application.routes.draw do

  get 'staticpages/team'
  get 'staticpages/contact'

  devise_for :petsitters
  devise_for :petowners
  resources :petsitters, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :associations, only: [:show]
end

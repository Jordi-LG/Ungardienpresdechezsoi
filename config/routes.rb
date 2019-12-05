Rails.application.routes.draw do

  get 'petsittings/new'
  get 'petsittings/create'
  root to: 'staticpages#index'
  get 'team', to: 'staticpages#team'
  get 'contact', to: 'staticpages#contact'



  devise_for :petsitters,  path: 'petsitters', controllers: { registrations: "petsitters/registrations"}
  devise_for :petowners
  resources :petsitters, only: [:show, :index] do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :petowners, only: [:show]
  resources :associations, only: [:show]
end

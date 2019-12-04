Rails.application.routes.draw do

  get 'avatars/create'
  get 'staticpages/team'
  get 'staticpages/contact'

  devise_for :petsitters
  devise_for :petowners
  resources :petsitters, only: [:show, :index] do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :associations, only: [:show]
end

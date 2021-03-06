Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations" }

  root 'personalities#index'
  post 'watson/search' => 'personalities#watson_search'
  post 'twitter/search' => 'personalities#twitter_search'
  get "/portraits" => 'personalities#recent'
  post 'personalities/:id/toggle_favorite' => 'personalities#toggle_favorite'

  resources :users

  resources :personalities do
    resources :comments
  end

end

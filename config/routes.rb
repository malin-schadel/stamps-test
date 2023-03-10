Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "qr_code", to: "pages#qr_code"
  get "map", to: "pages#map"

  resources :stamp_cards, only: [:index]

  get 'stamp_it', to: "stamp_cards#stamp_it"
  get 'create_card', to: "stamp_cards#create_card"
end

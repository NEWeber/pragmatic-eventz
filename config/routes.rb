Rails.application.routes.draw do
  resources :categories
  root "events#index"


  get "events/filter/:filter" => "events#index", as: :filtered_events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :registrations
    resources :likes
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users
  get "signup" => "users#new"

end

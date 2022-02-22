Rails.application.routes.draw do
  root "events#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :registrations
  end

  resources :users
  get "signup" => "users#new"
end

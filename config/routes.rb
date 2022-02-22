Rails.application.routes.draw do
  resources :users
  root "events#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :registrations
  end
end

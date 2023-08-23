Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'profile', to: 'pages#profile'
  resources :cats, except: [:index] do
    resources :reservations, except: [:destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :reservations, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end

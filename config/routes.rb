Rails.application.routes.draw do
  root to: "owners#index"

  resources :owners do
    resources :machines, only: [:index]
  end

  resources :machines, only: [:show] do
    resources :items, only: [:create, :delete, :new]
  end

  resources :items, except: [:create, :delete, :new]
end

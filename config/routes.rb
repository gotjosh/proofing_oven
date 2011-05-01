ProofingOven::Application.routes.draw do
  devise_for :users

  resources :candidates, :only => [:index, :show, :new, :create]

  namespace :api do
    scope ":authentication_token" do
      resources :candidates, only: [:index, :show]
    end
  end

  match 'ui(/:action)', controller: 'ui'
  root to: 'ui#index'
end

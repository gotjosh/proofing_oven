ProofingOven::Application.routes.draw do
  devise_for :users

  resources :candidates, except: :destroy

  namespace :api do
    scope ":authentication_token" do
      resources :candidates, only: [:index, :show]
    end
  end

  match 'ui(/:action)', controller: 'ui'
  root to: 'ui#index'
end

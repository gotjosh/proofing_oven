ProofingOven::Application.routes.draw do
  devise_for :users

  resources :candidates, except: :destroy do
    post :search, on: :collection, controller: "candidates_search"
    post :filter, on: :collection, controller: "candidates_filter"
  end

  match 'ui(/:action)', controller: 'ui'

  root to: 'pages#index'
end

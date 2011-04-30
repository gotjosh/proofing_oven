ProofingOven::Application.routes.draw do
  match 'ui(/:action)', controller: 'ui'
  devise_for :users
  root to: 'pages#index'
end

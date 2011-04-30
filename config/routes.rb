ProofingOven::Application.routes.draw do
  devise_for :users, :controllers => { sessions: "users/sessions", registrations: "users/registrations" }

  match 'ui(/:action)', controller: 'ui'
  root to: 'home#index'
end

ProofingOven::Application.routes.draw do
  devise_for :users, :controllers => { sessions: "users/sessions", registrations: "users/registrations" }

  match 'ui(/:action)', controller: 'ui'
  match 'user_root', :to => 'candidates#index', :as => "user_root"
  root to: 'home#index'
end

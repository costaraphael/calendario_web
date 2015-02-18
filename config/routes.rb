Rails.application.routes.draw do
  root 'home#index'

  resources :evento_tipos, only: :index

  resources :calendarios do
    resources :eventos
  end

  resources :campi

  get 'api/campi.:format' => 'api#campi'
  get 'api/calendario/:id_campus.:format' => 'api#calendario'

end

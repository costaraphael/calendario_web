Rails.application.routes.draw do
  scope path_names: {edit: 'editar', new: 'novo', show: 'visualizar'} do

    resources :usuarios
    resources :campi

    resources :calendarios do
      resources :eventos
    end

  end

  resources :evento_tipos, only: :index

  get '/login' => 'login#login'
  post '/login' => 'login#logar'
  get '/logout' => 'login#logout', as: 'logout'

  root 'home#index'
  get 'dados_pessoais' => 'home#dados_pessoais', as: 'dados_pessoais'
  post 'dados_pessoais' => 'home#salvar_dados_pessoais'

  get 'api/campi.:format' => 'api#campi', as: 'api_campi'
  get 'api/calendario/:id_campus.:format' => 'api#calendario', as: 'api_calendario'
end

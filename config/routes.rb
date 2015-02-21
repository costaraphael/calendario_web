Rails.application.routes.draw do

  # AUTENTICAÇÃO E HOME
  root 'home#index'
  get '/login' => 'login#login'
  post '/login' => 'login#logar'
  get '/logout' => 'login#logout', as: 'logout'
  get 'dados_pessoais' => 'home#dados_pessoais', as: 'dados_pessoais'
  post 'dados_pessoais' => 'home#salvar_dados_pessoais'

  # CADASTROS
  scope path_names: {edit: 'editar', new: 'novo'} do
    resources :usuarios, except: :show
    resources :campi, except: :show

    resources :calendarios, except: :show do
      resources :eventos
    end
  end
  resources :evento_tipos, only: :index

  # API
  get 'api/campi.:format' => 'api#campi', as: 'api_campi'
  get 'api/calendario/:id_campus.:format' => 'api#calendario', as: 'api_calendario'
end

Rails.application.routes.draw do

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    post 'answer', to: 'answer#question'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'   # Dashboard
    # resources :admins, only: [:index, :edit, :update]   # Administradores
    # resources :admins, except: [:destroy]   # cria todas as rotas menos a 'destroy'
    resources :admins     # todas as rotas habilitadas
    resources :subjects   # Assuntos/Áreas
    resources :questions   # Perguntas
  end

  devise_for :users
  devise_for :admins

  # get 'welcome/index'     # controller destruido

  # get 'inicio', to: 'welcome#index'
  get 'inicio', to: 'site/welcome#index'

  # root to: 'welcome#index'
  root to: 'site/welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

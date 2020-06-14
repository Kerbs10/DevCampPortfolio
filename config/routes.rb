Rails.application.routes.draw do
  root 'pages#home', except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact-me', to: 'pages#contact'

  resources :portfolios

  resources :blogs do
    member do
      get :toggle_status
    end
  end
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'mail_digests#index'

  resources :feeds
  resources :mail_digests
end

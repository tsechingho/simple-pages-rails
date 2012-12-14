Rails.application.routes.draw do
  root to: 'simple_pages/pages#index'
  devise_for :users
end

Rails.application.routes.draw do
  mount SimplePages::Engine, at: '/'
  root to: 'simple_pages/pages#index'
  devise_for :users
end

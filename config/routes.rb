Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  
  resources :users do
  resources :categories, controller: 'groups', as: 'groups' do
  resources :transactions, controller: 'expenses', as: 'expenses'
    end
  end
end

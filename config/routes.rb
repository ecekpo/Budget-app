Rails.application.routes.draw do
  root 'users#index'
  
  resources :users do
  resources :categories, controller: 'groups', as: 'groups' do
  resources :transactions, controller: 'expenses', as: 'expenses'
    end
  end
end

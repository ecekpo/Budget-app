Rails.application.routes.draw do
  devise_for :users
  root to: 'splash#splash'

  devise_scope :user do
    # root to: 'devise/sessions#new'
  end
  
  resources :groups, only: [:index, :new, :show, :create] do
    resources :expenses, only: [:index, :create, :new] do
      resources :group_expenses, only: [:create]
  end
end
end
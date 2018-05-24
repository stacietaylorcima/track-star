Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  resources :registered_applications 

  root 'welcome#index'
end

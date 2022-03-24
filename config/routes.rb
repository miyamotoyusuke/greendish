Rails.application.routes.draw do
  root to: 'dishes#index'
  
  resources :dishes
end

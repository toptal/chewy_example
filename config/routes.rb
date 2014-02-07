ChewyExample::Application.routes.draw do
  resources :entertainment
  root to: 'entertainment#index'
end

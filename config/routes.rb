Rails.application.routes.draw do
  resources :documents
  resources :tags
  root to: 'documents#index'
end

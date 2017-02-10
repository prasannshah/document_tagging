Rails.application.routes.draw do
  get 'showtagged', to: 'document_tags#index'
  resources :documents
  resources :tags
  root to: 'documents#index'
end

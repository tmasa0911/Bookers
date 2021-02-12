Rails.application.routes.draw do
  get "/" => "books#index"
  get "books" => "books#new"
  get "books/:id/edit" => "books#edit"
  get "books/:id" => "books#show"
  post "books/:id/destroy" => "books#destroy"
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

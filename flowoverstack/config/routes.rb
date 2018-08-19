Rails.application.routes.draw do
  devise_for :users
  get 'questions/index'
  root 'questions#index'
  resources :questions
  post 'comments/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

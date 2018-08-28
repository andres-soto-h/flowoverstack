Rails.application.routes.draw do
  devise_for :users
  get 'questions/index'
  root 'questions#index'
  resources :questions
  post 'answers/create'
  post 'comments/create'
  post 'questions/:question_id/:user_id', to: 'questions#vote_up', as: 'vote_up'
  post 'answers/:answer_id/:user_id', to: 'answers#ans_vote_up', as: 'ans_vote_up'

end

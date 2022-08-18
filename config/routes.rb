Rails.application.routes.draw do
  devise_for :users
  # ***** 以下を追加 *****
  root "posts#index"
  resources :posts
  # ***** 以上を追加 *****
end

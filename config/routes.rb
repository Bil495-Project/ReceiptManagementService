Rails.application.routes.draw do
  #root :to=>"home#index"
  root 'home#index'
  get 'home/index'
get "sign_in" => "authentication#sign_in"
get "signed_out" => "authentication#signed_out"
get "change_password" => "authentication#change_password"
get "forgot_password" => "authentication#forgot_password"
get "new_user" => "authentication#new_user"
get "password_sent" => "authentication#password_sent"
post "sign_in" => "authentication#login"
get "sign_in" => "authentication#sign_in"
post "new_user" => "authentication#register"
  resources :comments
  resources :receipts
  resources :tags
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

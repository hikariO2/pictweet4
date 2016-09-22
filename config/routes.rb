Rails.application.routes.draw do
  root 'tweets#index'
  get 'tweets' =>  'tweets#index'
  get 'tweets/new' => 'tweets/new'
end

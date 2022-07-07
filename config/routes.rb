Rails.application.routes.draw do
  devise_for :users 
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'user_stocks', to: 'user_stocks#create'
  get 'user_stocks_delete', to: 'user_stocks#destroy'
  get 'stocks_refresh', to: 'stocks#refresh'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  get 'user_friends', to: 'user_friends#create'
  get 'user_friends_delete', to: 'user_friends#destroy'
  get 'user_show_profile', to: 'users#show'
end

Rails.application.routes.draw do
  post 'group/create'
  get 'group/new'
  get 'group/show/:id' => 'group#show', as: 'group_show'
  get 'group/index'
  get 'group/has_group' => 'group#has_group'

  get 'user/new'
  post 'user/create'

  root 'sessions#homepage'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'
  get 'sessions/homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

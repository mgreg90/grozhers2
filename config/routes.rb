Rails.application.routes.draw do
  resources 'groups' do
    resources 'items'
  end
  resources 'sessions'
  resources 'users'
  get 'users/:id/has_group' => 'groups#has_group', as: 'user_has_group'

  root 'sessions#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

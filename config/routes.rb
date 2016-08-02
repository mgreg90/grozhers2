Rails.application.routes.draw do
  resources 'groups' do
    resources 'items'
    get :autocomplete_item_name, on: :collection
  end
  resources 'sessions'
  resources 'users'
  get 'users/:id/has_group' => 'groups#has_group', as: 'user_has_group'
  post 'groups/:group_id/items/:id' => 'groups#drop_item', as: 'drop_group_item'
  post 'groups/join' => 'groups#add_member', as: 'groups_join'
  post 'groups/leave' => 'groups#drop_member', as: 'groups_leave'

  root 'sessions#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

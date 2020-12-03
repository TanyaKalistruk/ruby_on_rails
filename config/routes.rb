Rails.application.routes.draw do
  get 'user_item/index'
  get 'login/log_in'
  post 'login/sign_in'
  get 'prostor/new'
  get 'prostor/create'
  post 'prostor/create'
  get 'prostor/edit/:id' => 'prostor#edit'
  get 'prostor/update'
  post 'prostor/update'
  get 'prostor/destroy/:id' => 'prostor#destroy'
  post 'prostor/destroy/:id' => 'prostor#destroy'
  get 'prostor/index/:id' => 'prostor#index'
end

Rails.application.routes.draw do
  scope module: :customers do
    get 'items/index'
    get 'items/show'
  end
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

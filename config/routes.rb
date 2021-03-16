Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/create'
    get 'addresses/destroy'
    get 'addresses/edit'
    get 'addresses/update'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  get 'order_details/update'
  get 'orders/show'
  get 'orders/update'
  get 'genres/index'
  get 'genres/create'
  get 'genres/edit'
  get 'genres/update'
  get 'items/index'
  get 'items/new'
  get 'items/create'
  get 'items/show'
  get 'items/edit'
  get 'items/update'
  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'homes/top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

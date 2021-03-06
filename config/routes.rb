Rails.application.routes.draw do
  devise_for :admin, :controllers => {
    :sessions => "admin/sessions"
  }

  devise_for :customer, :controllers => {
    :registrations => "public/registrations",
    :sessions => "public/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]

    resources :items, except: [:destroy]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    get "/customers/my_page" => "customers#show"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw"
    get "/customers/edit" => "customers#edit"
    patch "/customers" => "customers#update"


    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete :destroy_all
      end
    end

    resources :items, only: [:index, :show]

    # post "/orders/confirm" => "orders#confirm"
    # get "/orders/complete" => "orders#complete"
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post "confirm"
        get "complete"
      end
    end
  end
end

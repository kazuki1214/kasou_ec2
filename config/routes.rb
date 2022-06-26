Rails.application.routes.draw do

  namespace :admins do
    get 'top' => 'homes#top', as: 'top'
    get 'search' => 'homes#search', as: 'search'
    get 'customers/:customer_id/orders' => 'orders#index', as: 'customer_orders'
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, except:[:destroy]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :orders, only:[:index, :show, :update] do
      resources :order_details, only:[:update]
    end
  end

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about', as:'about'
    resources :items, only:[:index, :show]
    get 'customers/my_page' => 'customers#show', as:'my_page'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information'  => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as:'unsubscribe'
    patch 'customers/information' => 'customers#withdraw', as:'withdraw'
    resources :cart_items, only:[:index,:create, :update, :destroy] do
      member do
        delete :destroy_all
      end
    end
    resources :order, except:[:edit, :update, :destroy] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :addresse, except:[:new, :show]
  end

  devise_for :publics, controllers: {
    registrations: 'customers/registrations',
    sessions:      'customers/sessions'
  }
  devise_for :admins, controllers: {
    sessions:  'admins/sessions',
    passwords: 'admins/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

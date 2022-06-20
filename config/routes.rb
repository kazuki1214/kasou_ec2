Rails.application.routes.draw do
  scope module: :customers do
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

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

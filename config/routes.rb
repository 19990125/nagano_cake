Rails.application.routes.draw do
  devise_for :admins,controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }

  devise_for :customers,controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :admin do
    get 'homes/top' => "homes#top"
    resources :items,only: [:index,:show,:new,:edit,:update,:create]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :sessions,only: [:new,:create,:destroy]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :orders,only: [:show,:update]
    resources :orders_details,only: [:update]
    end
  get 'orders/complete' => "public/orders#complete"
  root to: 'public/homes#top'
  namespace :public do
    get 'homes/about' => "homes#about"
    resources :items,only: [:index,:show]
    resources :cart_items,only: [:index,:update,:create,:destroy]
    delete 'cart_items/destroy_all' => "cart_items#destroy_all"
    resources :customers,only: [:show,:edit,:update]
    get 'customers/unsubscribe' => "customers#unsubscribe"
    patch 'customers/withdraw' => "customers#withdraw"
    resources :orders,only: [:new,:show,:create,:index]
    post 'orders/comfirm' => "orders#comfirm"
    resources :registrations,only: [:new,:create]
    resources :sessions,only: [:new,:create,:destroy]
    resources :addresses,only: [:index,:edit,:create,:update,:destroy]
  end
end

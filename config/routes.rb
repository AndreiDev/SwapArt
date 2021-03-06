Tur::Application.routes.draw do

  get 'gallery/index'

  resources :swaps

  resources :wants

  resources :blocks
  delete 'user_blocks/:user_id', to: 'user_blocks#destroy'

  resources :taggings

  resources :items

  resources :tags

  resources :types

  resources :states

  resources :ages

  resources :regions

  authenticated :user do
    # root to: 'high_voltage/pages#show', id: 'home', as: :authenticated_root
    root to: 'gallery#show', as: :authenticated_root
    get '/about' => 'high_voltage/pages#show', id: 'about'
  end

  unauthenticated do
    root to: 'high_voltage/pages#show', id: 'home'
  end

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Needs this block to allow the integration of the Kerberos login form into the Devise::session Views
  #devise_scope :user do
  #  match '/users/auth/:provider/callback', to: 'devise/sessions#create', via: :post, :as => :auth_callback
  #end

  # high_voltage
  get '/home', to: redirect('/')

  resources :users
  get 'user_items/:swappee_id', to: 'user_items#show'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

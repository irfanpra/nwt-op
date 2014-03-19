NWTMarketinghub::Application.routes.draw do
  
  resources :users

  get "ads/index"
  resources :password_recovery_tokens
  #resources :review
  post 'review/add', to: 'review#add'
  post 'review/update', to: 'review#update'
  post 'review/delete', to: 'review#delete'
  get 'review/getall', to: 'review#getall'
  get 'review/get', to: 'review#get'
  
  post 'discussion/add', to: 'discussion#add'
  post 'discussion/update', to: 'discussion#update'
  post 'discussion/delete', to: 'discussion#delete'
  get 'discussion/getall', to: 'discussion#getall'
  get 'discussion/get', to: 'discussion#get'
  
  post 'attachment/add', to: 'attachment#add'
  post 'attachment/update', to: 'attachment#update'
  post 'attachment/delete', to: 'attachment#delete'
  get 'attachment/getall', to: 'attachment#getall'
  get 'attachment/get', to: 'attachment#get'
  
  wash_out :rumbas
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
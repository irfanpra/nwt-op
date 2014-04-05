NWTMarketinghub::Application.routes.draw do
  root :controller => 'home_page', :action => :index

  get 'ad/create', to: 'ad#create'
  get 'ad/update', to: 'ad#update'
  get 'ad/delete', to: 'ad#delete'
  get 'ad/buy', to: 'ad#buy'

  get 'search/users', :to => 'search#users'
  get 'search/ads', :to => 'search#ads'


  get 'ads/index'

  resources :users
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

  post 'user/create', to: 'users#create'
  post 'users/create', to: 'users#create'
  post 'user/login', to: 'users#login'
  post 'user/edit', to: 'users#edit'
  post 'user/reset', to: 'users#reset'
  get 'user/all', to: 'users#all'
  get 'user/get/(:id)', to: 'users#get'
  get 'user/logout', to: 'users#logout'
  get 'user/activate/:act_hash', to: 'users#activation', :as => :activation

  get 'user/recovery', to: 'password_recovery_tokens#pwd_recovery', :as => :pwd_recovery
  post 'user/recovery', to: 'password_recovery_tokens#pwd_recovery_post', :as => :pwd_recovery_post
  get 'user/recovery/:reset_hash', to:'password_recovery_tokens#pwd_recovery_confirm', :as => :pwd_recovery_confirm




  post 'subscription/add', to: 'subscription#add'
  get 'subscription/list/(:id)', to: 'subscription#list'
  get 'subscription/delete/(:id)', to: 'subscription#delete'



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
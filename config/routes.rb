FeedEngine::Application.routes.draw do

  devise_for(:users)
  
  get "feed/index"

  resources :users do 
    member { get 'profile'}
  end


  get "home/index"

    # resources :posts do 
    #   member do  
    #     get 'add_points'
    #     get 'refeed'
    #   end
    # end
  get "/:feed/posts/:id/add_points" => 'posts#add_points', as: 'add_points_feed_post'
  get "/:feed/posts/:id/refeed" => 'posts#refeed', as: 'refeed_feed_post'
  post "/:feed/posts" => 'posts#create', as: 'feed_posts'
  get "/:feed" => 'feeds#index', as: 'feed'
  
  root :to => "home#index"
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

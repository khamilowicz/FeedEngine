FeedEngine::Application.routes.draw do

  devise_for(:users)
  
  resources :users do 
    member { get 'profile'}
  end

  get "home/index"

  get "/:feed/posts/:id/add_points" => 'posts#add_points', as: 'add_points_feed_post'
  get "/:feed/posts/:id/refeed" => 'posts#refeed', as: 'refeed_feed_post'
  post "/:feed/posts" => 'posts#create', as: 'feed_posts'
  get "/:feed/ask_for_access" => 'feeds#ask_for_access', as: 'ask_for_access_feed'
  get "/:feed/visibility" => 'feeds#visibility', as: "visibility_feed"
  post "/:feed/visibility/:user_id" => 'feeds#approve_access', as: "approve_access_feed"
  get "/:feed/visibility/toggle" => 'feeds#toggle_visibility', as: "toggle_visibility_feed"
  get "/:feed/services" => 'feeds#services', as: "services_feed"
  post "/:feed/add_service" => 'feeds#add_service', as: 'add_service_feed'
  get "/:feed/subscribe" => "feeds#subscribe", as: "subscribe_feed"
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

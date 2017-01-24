Rails.application.routes.draw do

  get 'pages/about'
  get 'pages/contact'
  get 'pages/careers'
  get 'pages/services'
  get 'pages/terms'
  get 'pages/newsletter'

  devise_for :sellers, :path => '', :path_names => { :sign_up => 'thenorthremembers' }, 
                                     controllers: {registrations: 'registrations'}
 
 
  devise_for :users, :path_names => { :sign_up => 'theforceiswithme'}, controllers: {registrations: 'registrations'}

  resources :sellers, only: [:show]

  resources :sellers do
    put :follow, on: :member
  end

  resources :sellers do
    put :unfollow, on: :member
  end

  resources :users, only: [:show]

  get 'show_follow' => 'users#show_follow', path: 'users/:id/show_follow'

  root 'listings#landing'
  
  resources :listings

  resources :listings do
    put :save, on: :member
  end

  resources :listings do
    put :remove, on: :member
  end

  resources :subcategories, except: [:destroy]

  get 'listings/:id/remove_image2', to: 'listings#remove_image2', as: 'remove_listing_image2'

  
  get 'men' => 'subcategories#men', path: 'subcategories/:id/men'
  get 'women' => 'subcategories#women', path: 'subcategories/:id/women'
  get 'both' => 'subcategories#both', path: 'subcategories/:id/both'

  resources :applicants, only: [:new, :create]
  get 'rainsofcastamere', to: 'applicants#index'
  get 'thankyou', to: 'pages#thankyou'


  resources :categories, :path => '', except: [:destroy]
 
  

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

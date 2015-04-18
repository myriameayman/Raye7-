
RsgLinkedinGem::Application.routes.draw do 
 
  get "activities/index"

  get "requests/index" 

  get "requests/new" 

  get "requests/create" 

  get "requests/update" 

  get "requests/edit" 

  get "requests/delete" 

  get 'auth/:provider/callback', to: 'facebook#create' 

  get 'auth/failure', to: redirect('/') 

  get 'signout', to: 'facebook#destroy', as: 'signout' 
  
  root :to => 'profiles#myAccount' 
  
  get "profiles/new" 

  get "profiles/create" 

  get "profiles/show" 

  get "profiles/delete" 

  get "profiles/index" 

  get "profiles/edit" 

  get "welcome/index" 
  
  get "profiles/search" 
  
  get "profiles/show1" 
  
  get "trips/new" 
  
  get "requests/create" 
  
  get "requests/create_curr_location" 
  #root :to => 'requests#new' 
  get "/requests/new", to: "requests#new", as: "new" 
  
  get "/home", to: "requests#home", as: "home" 
  
  get "/geocoding", to: "requests#geocoding", as: "geocoding" 
  
  get "/reverse_geocoding", to: "requests#reverse_geocoding", as: "reverse_geocoding" 
  #devise_for :users 
  get "/requests/home/:latitude/:longitude" ,to: "requests#update", as: "create_form" 
  
  get "/requests/create_curr_location/:latitude/:longitude" ,to: "requests#update", as: "create_form" 
  
  get "/requests/create_curr_location/:latitude/:longitude" => "requests#update" 
  
  get "/requests/create_ride_info/:car_color/:car_model/:car_number/:seats" ,to: "requests#create_ride_info", as: "create_form" 
  
  get "/requests/create_ride_info" ,to: "requests#create_ride_info", as: "create_form" 
  
  get "requests/form", to: "requests#form" 

  get 'request/:id' => 'profiles#show' 
  
  match '/request/:id' => 'trips#create', :via => :post 

  devise_for :users, :controllers => {:registrations => "registrations"} 

  resources :circles 
  
  resources :requests 
  
  resources :profiles 
  
  get '/show' => "circles#show" 
  
  resources :twitter 
  
  match '/twitter_profile' => "twitter#twitter_profile" 
  
  match '/oauth_account' => "twitter#oauth_account" 
  
  match '/twitter_oauth_url' => 'twitter#generate_twitter_oauth_url' 
  
  resources :linkedin 
  
  get 'linkedin/index' 
  
  match '/linkedin_profile' => "linkedin#linkedin_profile" 
  #match '/index' => "linkedin#index" 
  match '/Linkedin_oauth_account' => "linkedin#Linkedin_oauth_account" 
  
  match '/linkedin_oauth_url' => 'linkedin#generate_linkedin_oauth_url' 
  
  resources :circles 
  resources :activities
  devise_scope :user do 
      #root :to => 'profiles#myAccount' 
      root :to => 'user/registrations#myAccount' 
      #get 'user/registrations/myAccount' 
      get "/users/myAccount" => "user/registrations#myAccount", :as => "myAccount" 
      get "/ConnectTo.html.erb" => "welcome#ConnectTo", :as => "ConnectTo" 
      #get "/users/newLinkedin"=> "user/registrations#newLinkedin", :as => "newLinkedin" 
      #get "/users/newLinkedin"=> "user/registrations#newLinkedin", :as => "newLinkedin" 

      #get 'signin' => 'devise/sessions#new', :as => :new_user_session 
      #get 'newLinkedin' => 'registrations#new'. as: : 
      #match '/newLinkedin' => "registrations#newLinkedin" 
       get 'users/sign_out', to: 'devise/sessions#destroy', as: :signout 
      #get '/users/signout', to: 'user/sessions#destroy', as: :signout 
    end 
  

  # The priority is based upon order of cr eation: 
  # first created -> highest priority. 

  # Sample of regular route: 
  #   match 'products/:id' => 'catalog#view' 
  # Keep in mind you can assign values other than :controller and :action 

  # Sample of named route: 
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase 
  # This route can be invoked with purchase_url(:id => product.id) 

  # Sample resource route (maps HTTP verbs to controller actions automatically): 
  #   resources :products 

  # Sample resource route with options: 
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

  # Sample resource route with sub-resources: 
  #   resources :products do 
  #     resources :comments, :sales 
  #     resource :seller 
  #   end 

  # Sample resource route with more complex sub-resources 
  #   resources :products do 
  #     resources :comments 
  #     resources :sales do 
  #       get 'recent', :on => :collection 
  #     end 
  #   end 

  # Sample resource route within a namespace: 
  #   namespace :admin do 
  #     # Directs /admin/products/* to Admin::ProductsController 
  #     # (app/controllers/admin/products_controller.rb) 
  #     resources :products 
  #   end 

  # You can have the root of your site routed with "root" 
  # just remember to delete public/index.html. 
  # root :to => 'welcome#index' 

  # See how all your routes lay out with "rake routes" 

  # This is a legacy wild controller route that's not recommended for RESTful applications. 
  # Note: This route will make all actions in every controller accessible via GET requests. 
  # match ':controller(/:action(/:id))(.:format)' 


# The priority is based upon order of cr eation: 
# first created -> highest priority. 
# Sample of regular route: 
# match 'products/:id' => 'catalog#view' 
# Keep in mind you can assign values other than :controller and :action 
# Sample of named route: 
# match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase 
# This route can be invoked with purchase_url(:id => product.id) 
# Sample resource route (maps HTTP verbs to controller actions automatically): 
# resources :products 
# Sample resource route with options: 
# resources :products do 
# member do 
# get 'short' 
# post 'toggle' 
# end 
# 
# collection do 
# get 'sold' 
# end 
# end 
# Sample resource route with sub-resources: 
# resources :products do 
# resources :comments, :sales 
# resource :seller 
# end 
# Sample resource route with more complex sub-resources 
# resources :products do 
# resources :comments 
# resources :sales do 
# get 'recent', :on => :collection 
# end 
# end 
# Sample resource route within a namespace: 
# namespace :admin do 
# # Directs /admin/products/* to Admin::ProductsController 
# # (app/controllers/admin/products_controller.rb) 
# resources :products 
# end 
# You can have the root of your site routed with "root" 
# just remember to delete public/index.html. 
# root :to => 'welcome#index' 
# See how all your routes lay out with "rake routes" 
# This is a legacy wild controller route that's not recommended for RESTful applications. 
# Note: This route will make all actions in every controller accessible via GET requests. 
# match ':controller(/:action(/:id))(.:format)' 
end 
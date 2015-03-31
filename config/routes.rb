RsgLinkedinGem::Application.routes.draw do
  get "welcome/index"
  #root :to => 'welcome#index'

  #devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
 # match '/newLinkedin' => "registrations#newLinkedin"
  #get 'registrations/newLinkedin'

  #root :to => 'user/registrations#myAccount'

  resources :circles
  
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
  #match 'users/sign_out' => "user/sessions#destroy"
  #get "/log_out" => "linkedin#logout", :as => "logout"
  #root :to => 'linkedin#index'
  #get "/users/sign_out"
   #match "users/my_account" => "users/registrations#my_account", :as => "my_account"
   devise_scope :user do
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
   # get '/users/signout', to: 'user/sessions#destroy', as: :signout
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
end

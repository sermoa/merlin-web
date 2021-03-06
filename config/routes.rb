Merlin::Application.routes.draw do

  match '/menu' => 'pages#choice', as: :choice
  match '/notes' => 'pages#notes', as: :notes
  match '/about' => 'pages#about', as: :about

  match '/adventure/new' => 'adventure#new', as: :new_adventure
  match '/adventure' => 'adventure#play', as: :adventure
  match '/go/:direction' => 'adventure#move', as: :move

  match '/take/:item' => 'items#take', as: :take_item
  match '/drop/:item' => 'items#drop', as: :drop_item
  match '/use/:item' => 'items#use', as: :use_item

  match '/adventure/quit' => 'adventure#quit', as: :quit_adventure
  match '/quit' => 'adventure#really_quit', as: :really_quit_adventure, via: :post

  match '/sign-in' => 'sessions#new', as: :sign_in
  match '/engage' => 'sessions#create', as: :engage, via: :post
  match '/sign-out' => 'sessions#destroy', as: :sign_out

  resources :saved_adventures, only: [:create]
  match '/save' => 'saved_adventures#new', as: :save_adventure
  match '/load' => 'saved_adventures#index', as: :load_adventure
  match '/restore/:id' => 'saved_adventures#restore', as: :restore_adventure

  resources :scores, only: [:index, :create]

  root to: 'pages#splash'

  # The priority is based upon order of creation:
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

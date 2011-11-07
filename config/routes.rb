Prgmnewsletter::Application.routes.draw do
  #resources :newsletters
  devise_for :users, :path=>"users", :path_names => { :sign_in => 'login', :sign_up => 'new_user' }

  #devise_for :users
  resources :newsletters do 
  	collection do
		get :language
	end
  end

  scope :module => :newsletter do 
  	match "historylistnewsletter" => "newsletters#index"
	match "imgnewsletters/:id" => "newsletters#show"
	match "statistics" => "newsletters#index"
	match "historystatistics" => "newsletters#index"
	match "searchnewsletters" => "newsletters#index"
  end

  scope :module => :mailstart do
  	match "sort" => "mailstart#show"
  end

  scope :module => :categoryall do
	match "categoryallslists" => "categoryalls#index"
  	match "sort" => "categoryalls#show"
  end

  scope :module => :subcontact do
	match "subcontactslists" => "subcontacts#index"
	match "choosesubcontacts_to_categoryalls/:id/:categoryall_id/:categoryall_id_source" => "subcontacts#edit"
	match "result_dragondropsubcontacts" => "subcontacts#index"
        match "sort" => "subcontacts#show"
	match "subcontactsremove" => "subcontacts#index"
  end

  scope :module => :mail do
	match "mailslists" => "mails#index" 
  	match "sort" => "mails#show"
	match "mailsremove" => "mails#index"
	match "choosemails_to_subcontacts/:id/:subcontact_id/:subcontact_id_source" => "mails#edit"
	match "result_dragondropmails" => "mails#index"
  end

  root :to => "newsletters#index"
  
  resources :mailstarts do
	  collection do 
	  	resources :categoryalls do
			collection do 
				resources :subcontacts do
					collection do
						resources :mails do 
						end
					end
				end
			end
		end
	  end
  end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

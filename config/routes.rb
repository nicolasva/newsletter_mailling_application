Prgmnewsletter::Application.routes.draw do
  #resources :newsletters
  devise_for :users, :path=>"users", :path_names => { :sign_in => 'login', :sign_up => 'new_user' }

  #devise_for :users
  resources :newsletters do 
  	collection do
		get :language
		resources :statistics
		#resources :newslettertimingprogrammings
	end
  end

  scope :module => :newslettertimingprogramming do 
  	match "newsletter/:newsletter_id/programminglist" => "newslettertimingprogrammings#index"
  end

  scope :module => :statistic do
  	match "newsletter/:newsletter_id/statistic" => "statistics#show"
	  match "newsletter/statistic/pixelstatistic/:newsletter_id" => "statistics#create"
  	match "newsletter/statistic/historystatistic" => "statistics#show"
  end

  scope :module => :newsletter do 
  	match "historylistnewsletter" => "newsletters#index"
	  match "imgnewsletters/:id" => "newsletters#show"
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
	  match "set_cookies_drag_and_drop_cut_subcontact" => "subcontacts#index"
	  match "copy_or_cut_subcontact" => "subcontacts#show"
    match "verif_copy_or_cut_subcontact" => "subcontacts#show"
  end

  scope :module => :email do
	  match "mailslists" => "emails#index" 
  	match "sort" => "emails#show"
	  match "mailsremove" => "emails#index"
	  match "choosemails_to_subcontacts/:id/:subcontact_id/:subcontact_id_source" => "emails#edit"
	  match "result_dragondropmails" => "emails#index"
    match "set_cookies_drag_and_drop_cut_email" => "emails#index"
    match "copy_or_cut_email" => "emails#show"
    match "verif_copy_or_cut_email" => "emails#show"
    match "import_emails" => "emails#index"
    match "import_emails_bd" => "emails#edit"
    match "import_emails_excel" => "emails#edit"
  end

  root :to => "newsletters#index"
 
  resources :mailstarts do
	  collection do 
	  	resources :categoryalls do
			collection do 
				resources :subcontacts do
					collection do
						resources :emails do 
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

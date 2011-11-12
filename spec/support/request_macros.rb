module RequestMacros
	def login_user
   	  @user = Factory(:user)
   	  visit "/users/login"
	  page.should have_content("Identifiant")
	  fill_in "Identifiant", :with => @user.username
	  fill_in "Mot de passe", :with => @user.password
	  click_button "Sign in"
	end
end

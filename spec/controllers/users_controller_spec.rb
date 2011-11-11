require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe UsersController do 
	def valid_attributes
	  {}
	end

	describe "GET index" do
		it "assigns all users as @users" do
		    user = User.create! valid_attributes
		    get :index
		    assigns(:users).should eq([user])
		end
	end

	describe "POST create" do
		describe "with valid params" do
			it "created a new User" do
				expect {
				  post :create, :user => valid_attributes
				}.to_change(User, :count).by(1)
			end

			it "assigns a newly created user as @user" do
				post :create, :user => valid_attributes
				assigns(:user).should be_a(User)
				assigns(:user).should be_persisted
			end

			it "redirects to the created user" do
				post :create, :user => valid_attributes
				assigns(:user).should be_a(User)
				assigns(:user).should be_persisted
			end

			it "redirects to the created user" do
				post :create, :user => valid_attributes
				response.should redirect_to(users_path)
			end
		end

		describe "with invalid params" do
			it "assigns a newly created but unsaved user as @user" do
				User.any_instance.stub(:save).and_return(false)
				post :create, :user => {}
				assigns(:user).should be_a_new(User)
			end

			it "re-renders the 'new' template" do
				User.any_instance.stub(:save).and_return(false)
				post :create, :user => {}
				response.should redirect_to(users_path)
			end	
		end
	end
end
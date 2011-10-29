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

describe CategoryallsController do

  # This should return the minimal set of attributes required to create a valid
  # Categoryall. As you add validations to Categoryall, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all categoryalls as @categoryalls" do
      categoryall = Categoryall.create! valid_attributes
      get :index
      assigns(:categoryalls).should eq([categoryall])
    end
  end

  describe "GET show" do
    it "assigns the requested categoryall as @categoryall" do
      categoryall = Categoryall.create! valid_attributes
      get :show, :id => categoryall.id.to_s
      assigns(:categoryall).should eq(categoryall)
    end
  end

  describe "GET new" do
    it "assigns a new categoryall as @categoryall" do
      get :new
      assigns(:categoryall).should be_a_new(Categoryall)
    end
  end

  describe "GET edit" do
    it "assigns the requested categoryall as @categoryall" do
      categoryall = Categoryall.create! valid_attributes
      get :edit, :id => categoryall.id.to_s
      assigns(:categoryall).should eq(categoryall)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Categoryall" do
        expect {
          post :create, :categoryall => valid_attributes
        }.to change(Categoryall, :count).by(1)
      end

      it "assigns a newly created categoryall as @categoryall" do
        post :create, :categoryall => valid_attributes
        assigns(:categoryall).should be_a(Categoryall)
        assigns(:categoryall).should be_persisted
      end

      it "redirects to the created categoryall" do
        post :create, :categoryall => valid_attributes
        response.should redirect_to(Categoryall.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved categoryall as @categoryall" do
        # Trigger the behavior that occurs when invalid params are submitted
        Categoryall.any_instance.stub(:save).and_return(false)
        post :create, :categoryall => {}
        assigns(:categoryall).should be_a_new(Categoryall)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Categoryall.any_instance.stub(:save).and_return(false)
        post :create, :categoryall => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested categoryall" do
        categoryall = Categoryall.create! valid_attributes
        # Assuming there are no other categoryalls in the database, this
        # specifies that the Categoryall created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Categoryall.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => categoryall.id, :categoryall => {'these' => 'params'}
      end

      it "assigns the requested categoryall as @categoryall" do
        categoryall = Categoryall.create! valid_attributes
        put :update, :id => categoryall.id, :categoryall => valid_attributes
        assigns(:categoryall).should eq(categoryall)
      end

      it "redirects to the categoryall" do
        categoryall = Categoryall.create! valid_attributes
        put :update, :id => categoryall.id, :categoryall => valid_attributes
        response.should redirect_to(categoryall)
      end
    end

    describe "with invalid params" do
      it "assigns the categoryall as @categoryall" do
        categoryall = Categoryall.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Categoryall.any_instance.stub(:save).and_return(false)
        put :update, :id => categoryall.id.to_s, :categoryall => {}
        assigns(:categoryall).should eq(categoryall)
      end

      it "re-renders the 'edit' template" do
        categoryall = Categoryall.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Categoryall.any_instance.stub(:save).and_return(false)
        put :update, :id => categoryall.id.to_s, :categoryall => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested categoryall" do
      categoryall = Categoryall.create! valid_attributes
      expect {
        delete :destroy, :id => categoryall.id.to_s
      }.to change(Categoryall, :count).by(-1)
    end

    it "redirects to the categoryalls list" do
      categoryall = Categoryall.create! valid_attributes
      delete :destroy, :id => categoryall.id.to_s
      response.should redirect_to(categoryalls_url)
    end
  end

end

require "spec_helper"

describe SubcontactsController do
  describe "routing" do

    it "routes to #index" do
      get("/subcontacts").should route_to("subcontacts#index")
    end

    it "routes to #new" do
      get("/subcontacts/new").should route_to("subcontacts#new")
    end

    it "routes to #show" do
      get("/subcontacts/1").should route_to("subcontacts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/subcontacts/1/edit").should route_to("subcontacts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/subcontacts").should route_to("subcontacts#create")
    end

    it "routes to #update" do
      put("/subcontacts/1").should route_to("subcontacts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/subcontacts/1").should route_to("subcontacts#destroy", :id => "1")
    end

  end
end

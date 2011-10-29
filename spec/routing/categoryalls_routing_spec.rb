require "spec_helper"

describe CategoryallsController do
  describe "routing" do

    it "routes to #index" do
      get("/categoryalls").should route_to("categoryalls#index")
    end

    it "routes to #new" do
      get("/categoryalls/new").should route_to("categoryalls#new")
    end

    it "routes to #show" do
      get("/categoryalls/1").should route_to("categoryalls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/categoryalls/1/edit").should route_to("categoryalls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/categoryalls").should route_to("categoryalls#create")
    end

    it "routes to #update" do
      put("/categoryalls/1").should route_to("categoryalls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/categoryalls/1").should route_to("categoryalls#destroy", :id => "1")
    end

  end
end

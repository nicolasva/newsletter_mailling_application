require "spec_helper"

describe NewslettertimingprogrammingsController do
  describe "routing" do

    it "routes to #index" do
      get("/newslettertimingprogrammings").should route_to("newslettertimingprogrammings#index")
    end

    it "routes to #new" do
      get("/newslettertimingprogrammings/new").should route_to("newslettertimingprogrammings#new")
    end

    it "routes to #show" do
      get("/newslettertimingprogrammings/1").should route_to("newslettertimingprogrammings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/newslettertimingprogrammings/1/edit").should route_to("newslettertimingprogrammings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/newslettertimingprogrammings").should route_to("newslettertimingprogrammings#create")
    end

    it "routes to #update" do
      put("/newslettertimingprogrammings/1").should route_to("newslettertimingprogrammings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/newslettertimingprogrammings/1").should route_to("newslettertimingprogrammings#destroy", :id => "1")
    end

  end
end

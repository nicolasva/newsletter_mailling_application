require "spec_helper"

describe StatisticsController do
  describe "routing" do

    it "routes to #index" do
      get("/statistics").should route_to("statistics#index")
    end

    it "routes to #new" do
      get("/statistics/new").should route_to("statistics#new")
    end

    it "routes to #show" do
      get("/statistics/1").should route_to("statistics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/statistics/1/edit").should route_to("statistics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/statistics").should route_to("statistics#create")
    end

    it "routes to #update" do
      put("/statistics/1").should route_to("statistics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/statistics/1").should route_to("statistics#destroy", :id => "1")
    end

  end
end

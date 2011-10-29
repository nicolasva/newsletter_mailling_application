require "spec_helper"

describe MailstartsController do
  describe "routing" do

    it "routes to #index" do
      get("/mailstarts").should route_to("mailstarts#index")
    end

    it "routes to #new" do
      get("/mailstarts/new").should route_to("mailstarts#new")
    end

    it "routes to #show" do
      get("/mailstarts/1").should route_to("mailstarts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mailstarts/1/edit").should route_to("mailstarts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mailstarts").should route_to("mailstarts#create")
    end

    it "routes to #update" do
      put("/mailstarts/1").should route_to("mailstarts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mailstarts/1").should route_to("mailstarts#destroy", :id => "1")
    end

  end
end

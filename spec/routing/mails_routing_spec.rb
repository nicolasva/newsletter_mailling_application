require "spec_helper"

describe MailsController do
  describe "routing" do

    it "routes to #index" do
      get("/mails").should route_to("mails#index")
    end

    it "routes to #new" do
      get("/mails/new").should route_to("mails#new")
    end

    it "routes to #show" do
      get("/mails/1").should route_to("mails#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mails/1/edit").should route_to("mails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mails").should route_to("mails#create")
    end

    it "routes to #update" do
      put("/mails/1").should route_to("mails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mails/1").should route_to("mails#destroy", :id => "1")
    end

  end
end

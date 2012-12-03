require "spec_helper"

describe WorksitesController do
  describe "routing" do

    it "routes to #index" do
      get("/worksites").should route_to("worksites#index")
    end

    it "routes to #new" do
      get("/worksites/new").should route_to("worksites#new")
    end

    it "routes to #show" do
      get("/worksites/1").should route_to("worksites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/worksites/1/edit").should route_to("worksites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/worksites").should route_to("worksites#create")
    end

    it "routes to #update" do
      put("/worksites/1").should route_to("worksites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/worksites/1").should route_to("worksites#destroy", :id => "1")
    end

  end
end

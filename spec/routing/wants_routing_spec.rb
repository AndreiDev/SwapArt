require "rails_helper"

RSpec.describe WantsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/wants").to route_to("wants#index")
    end

    it "routes to #new" do
      expect(:get => "/wants/new").to route_to("wants#new")
    end

    it "routes to #show" do
      expect(:get => "/wants/1").to route_to("wants#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/wants/1/edit").to route_to("wants#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/wants").to route_to("wants#create")
    end

    it "routes to #update" do
      expect(:put => "/wants/1").to route_to("wants#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/wants/1").to route_to("wants#destroy", :id => "1")
    end

  end
end

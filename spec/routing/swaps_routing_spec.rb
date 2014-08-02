require "rails_helper"

RSpec.describe SwapsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/swaps").to route_to("swaps#index")
    end

    it "routes to #new" do
      expect(:get => "/swaps/new").to route_to("swaps#new")
    end

    it "routes to #show" do
      expect(:get => "/swaps/1").to route_to("swaps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/swaps/1/edit").to route_to("swaps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/swaps").to route_to("swaps#create")
    end

    it "routes to #update" do
      expect(:put => "/swaps/1").to route_to("swaps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/swaps/1").to route_to("swaps#destroy", :id => "1")
    end

  end
end

require 'rails_helper'

RSpec.describe "Swaps", :type => :request do
  describe "GET /swaps" do
    it "works! (now write some real specs)" do
      get swaps_path
      expect(response.status).to be(200)
    end
  end
end

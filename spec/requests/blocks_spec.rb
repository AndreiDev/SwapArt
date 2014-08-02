require 'rails_helper'

RSpec.describe "Blocks", :type => :request do
  describe "GET /blocks" do
    it "works! (now write some real specs)" do
      get blocks_path
      expect(response.status).to be(200)
    end
  end
end

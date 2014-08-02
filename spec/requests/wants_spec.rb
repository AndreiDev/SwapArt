require 'rails_helper'

RSpec.describe "Wants", :type => :request do
  describe "GET /wants" do
    it "works! (now write some real specs)" do
      get wants_path
      expect(response.status).to be(200)
    end
  end
end

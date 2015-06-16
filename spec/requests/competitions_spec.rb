require 'rails_helper'

RSpec.describe "Competitions", type: :request do
  describe "GET /competitions" do
    it "has a status of 200" do
      get competitions_path
      expect(response).to have_http_status(200)
    end
  end
end

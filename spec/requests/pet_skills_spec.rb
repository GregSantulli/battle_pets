require 'rails_helper'

RSpec.describe "PetSkills", type: :request do
  describe "GET /pet_skills" do
    it "works! (now write some real specs)" do
      get pet_skills_path
      expect(response).to have_http_status(200)
    end
  end
end

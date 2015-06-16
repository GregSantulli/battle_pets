require "rails_helper"

RSpec.describe PetSkillsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pet_skills").to route_to("pet_skills#index")
    end

    it "routes to #new" do
      expect(:get => "/pet_skills/new").to route_to("pet_skills#new")
    end

    it "routes to #show" do
      expect(:get => "/pet_skills/1").to route_to("pet_skills#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pet_skills/1/edit").to route_to("pet_skills#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pet_skills").to route_to("pet_skills#create")
    end

    it "routes to #update" do
      expect(:put => "/pet_skills/1").to route_to("pet_skills#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pet_skills/1").to route_to("pet_skills#destroy", :id => "1")
    end

  end
end

require 'rails_helper'

RSpec.describe "pet_skills/index", type: :view do
  before(:each) do
    assign(:pet_skills, [
      PetSkill.create!(
        :level => 1,
        :battle_pet => nil,
        :skill => nil
      ),
      PetSkill.create!(
        :level => 1,
        :battle_pet => nil,
        :skill => nil
      )
    ])
  end

  it "renders a list of pet_skills" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "pet_skills/show", type: :view do
  before(:each) do
    @pet_skill = assign(:pet_skill, PetSkill.create!(
      :level => 1,
      :battle_pet => nil,
      :skill => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

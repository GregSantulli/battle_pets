require 'rails_helper'

RSpec.describe "pet_skills/new", type: :view do
  before(:each) do
    assign(:pet_skill, PetSkill.new(
      :level => 1,
      :battle_pet => nil,
      :skill => nil
    ))
  end

  it "renders new pet_skill form" do
    render

    assert_select "form[action=?][method=?]", pet_skills_path, "post" do

      assert_select "input#pet_skill_level[name=?]", "pet_skill[level]"

      assert_select "input#pet_skill_battle_pet_id[name=?]", "pet_skill[battle_pet_id]"

      assert_select "input#pet_skill_skill_id[name=?]", "pet_skill[skill_id]"
    end
  end
end

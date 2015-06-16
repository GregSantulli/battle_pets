require 'rails_helper'

RSpec.describe "pet_skills/edit", type: :view do
  before(:each) do
    @pet_skill = assign(:pet_skill, PetSkill.create!(
      :level => 1,
      :battle_pet => nil,
      :skill => nil
    ))
  end

  it "renders the edit pet_skill form" do
    render

    assert_select "form[action=?][method=?]", pet_skill_path(@pet_skill), "post" do

      assert_select "input#pet_skill_level[name=?]", "pet_skill[level]"

      assert_select "input#pet_skill_battle_pet_id[name=?]", "pet_skill[battle_pet_id]"

      assert_select "input#pet_skill_skill_id[name=?]", "pet_skill[skill_id]"
    end
  end
end

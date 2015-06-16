class AddSkillToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :skill_id, :integer
  end
end

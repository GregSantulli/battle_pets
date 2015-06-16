class CreatePetSkills < ActiveRecord::Migration
  def change
    create_table :pet_skills do |t|
      t.integer :level
      t.references :battle_pet, index: true
      t.references :skill, index: true

      t.timestamps null: false
    end
  end
end

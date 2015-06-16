class CreatePetCompetitions < ActiveRecord::Migration
  def change
    create_table :pet_competitions do |t|
      t.references :battle_pet, index: true
      t.references :competition, index: true

      t.timestamps null: false
    end
    add_foreign_key :pet_competitions, :battle_pets
    add_foreign_key :pet_competitions, :competitions
  end
end

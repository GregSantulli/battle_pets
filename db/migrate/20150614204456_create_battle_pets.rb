class CreateBattlePets < ActiveRecord::Migration
  def change
    create_table :battle_pets do |t|
      t.string :name
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :battle_pets, :users
  end
end

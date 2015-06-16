class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.references :winner, index: true
      t.string :hash_id


      t.timestamps null: false
    end
  end
end

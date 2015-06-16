class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.references :winner, index: true


      t.timestamps null: false
    end
  end
end

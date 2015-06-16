class AddCompleteToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :complete, :boolean
  end
end

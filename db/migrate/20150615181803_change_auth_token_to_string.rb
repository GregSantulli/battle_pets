class ChangeAuthTokenToString < ActiveRecord::Migration
  def change
    change_column :users, :auth_token, :string
  end
end

class RemoveDistanceFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :distance, :integer
  end
end

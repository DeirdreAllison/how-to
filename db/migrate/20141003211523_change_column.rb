class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :steps, :list_id, :integer
  end
end

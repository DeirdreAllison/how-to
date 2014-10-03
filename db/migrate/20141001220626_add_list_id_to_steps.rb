class AddListIdToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :list_id, :string
  end
end

class AddProjectIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :project_id, :integer
  end
end

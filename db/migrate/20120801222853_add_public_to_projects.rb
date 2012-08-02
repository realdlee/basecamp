class AddPublicToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :public, :integer
  end
end

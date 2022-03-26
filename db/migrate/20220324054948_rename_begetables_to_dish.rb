class RenameBegetablesToDish < ActiveRecord::Migration[6.1]
  def change
    rename_column :dishes, :begetables, :vegetables
  end
end

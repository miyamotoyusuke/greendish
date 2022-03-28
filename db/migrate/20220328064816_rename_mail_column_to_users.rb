class RenameMailColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :mail, :email
  end
end

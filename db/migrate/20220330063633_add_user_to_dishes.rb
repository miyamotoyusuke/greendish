class AddUserToDishes < ActiveRecord::Migration[6.1]
  def change
    add_reference :dishes, :user, null: false, foreign_key: true
  end
end

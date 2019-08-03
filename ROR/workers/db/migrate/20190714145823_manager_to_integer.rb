class ManagerToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :deparments, :manager, :string
    add_column :deparments, :manager, :integer
  end
end

class CreateDeparments < ActiveRecord::Migration[6.0]
  def change
    create_table :deparments do |t|
      t.string :name
      t.string :manager
      t.string :code

      t.timestamps
    end
  end
end

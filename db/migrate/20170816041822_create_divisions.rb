class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions do |t|
      t.integer :no
      t.text :name

      t.timestamps
    end
  end
end

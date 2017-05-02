class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.integer :number, null: false
      t.string :text, null: false

      t.timestamps
    end
    add_index :lines, :number
  end
end

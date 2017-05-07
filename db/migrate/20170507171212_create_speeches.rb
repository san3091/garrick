class CreateSpeeches < ActiveRecord::Migration[5.1]
  def change
    create_table :speeches do |t|
      t.integer :number, null: false
      t.belongs_to :character, foreign_key: true

      t.timestamps
    end
    add_index :speeches, :number
  end
end

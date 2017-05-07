class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.belongs_to :scene, foreign_key: true

      t.timestamps
    end
    add_index :characters, :name
  end
end

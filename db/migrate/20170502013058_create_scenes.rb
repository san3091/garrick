class CreateScenes < ActiveRecord::Migration[5.1]
  def change
    create_table :scenes do |t|
      t.string :title
      t.string :setting

      t.timestamps
    end
    add_index :scenes, :title
  end
end

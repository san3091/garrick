class AddSceneToLine < ActiveRecord::Migration[5.1]
  def change
    add_reference :lines, :scene, foreign_key: true
  end
end

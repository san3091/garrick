class AddCharacterToLine < ActiveRecord::Migration[5.1]
  def change
    add_reference :lines, :character, foreign_key: true
  end
end

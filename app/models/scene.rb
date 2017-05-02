class Scene < ApplicationRecord
  has_many :lines, dependent: :destroy
  has_many :characters, through: :lines
end

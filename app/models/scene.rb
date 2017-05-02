class Scene < ApplicationRecord
  has_many :lines
  has_many :characters, through: :lines
end

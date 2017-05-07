class Scene < ApplicationRecord
  has_many :characters
  has_many :speeches, through: :characters
end

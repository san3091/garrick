class Character < ApplicationRecord
  belongs_to :scene
  has_many :speeches
  has_many :lines, through: :speeches
end

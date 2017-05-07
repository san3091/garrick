class Speech < ApplicationRecord
  belongs_to :character
  has_many :lines
end

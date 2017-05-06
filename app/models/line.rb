class Line < ApplicationRecord
  belongs_to :character
  belongs_to :scene

  scope :in_scene, -> (scene) { where(scene: scene) }
end

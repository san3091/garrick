class Line < ApplicationRecord
  belongs_to :speech

  scope :in_scene, -> (scene) { where(scene: scene) }
end

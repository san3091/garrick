class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find(params[:id])
    @lines = @scene.lines.includes(:character)
  end
end

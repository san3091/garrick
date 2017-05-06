class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find(params[:id])
    @first_line = Line.in_scene(@scene).find_by_number(1) if params[:include_first_line]
  end
end

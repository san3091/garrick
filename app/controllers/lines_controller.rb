class LinesController < ApplicationController
  before_action :set_line
  before_action :set_scene

  def show
    case params[:action]
    when 'next'
      @line = @scene.next_line(@line)
    when 'prev'
      @line = @scene.previous_line(@line)
    end

    # ActionCable.server.broadcast "lines_channel", 
    #                           line: render_line(message)
  end

  private

  def set_scene
    @scene = @line.scene
  end

  def set_line
    @line = Line.find(params[:id])
  end

  def render_line
    render(partial: 'line', locals: { line: @line })
  end
end

class LinesController < ApplicationController
  before_action :set_line
  before_action :set_scene

  def show
    case params[:query]
    when 'next'
      @line = find_next_line
    when 'prev'
      @line = find_previous_line
    end

    ActionCable.server.broadcast "lines_channel", 
                              line: render_line(@line)
  end

  private

  def find_next_line
    Line.in_scene(@scene).find_by_number(@line.number + 1)
  end

  def find_previous_line
    Line.in_scene(@scene).find_by_number(@line.number - 1)
  end

  def set_scene
    @scene = @line.scene
  end

  def set_line
    @line = Line.find(params[:id])
  end

  def render_line(line)
    render(partial: 'line', locals: { line: line })
  end
end

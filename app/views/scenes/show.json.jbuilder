json.partial! 'scenes/scene', scene: @scene
if @first_line
  json.first_line do
    json.partial! 'lines/line', line: @first_line
  end
end
json.extract! line, :id, :text, :number
json.character do 
  json.name   line.character.name
end

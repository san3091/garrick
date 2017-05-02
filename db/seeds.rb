# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do
  Scene.transaction do
    scene_one = Scene.create(title: Faker::Book.title)

    character_one     = Character.create(name: Faker::Zelda.character)
    character_two     = Character.create(name: Faker::Zelda.character)

    line_number = 1
    5.times do 
      [character_one, character_two].each do |character|
        (rand(6) + 1).times do
          line = Line.new(number: line_number, text: Faker::Hipster.sentence(4))
          character.lines << line
          scene_one.lines << line
          line.save
          line_number += 1
        end
      end
    end

  end
end
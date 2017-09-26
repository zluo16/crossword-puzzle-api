# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# data = []
# offset = 2656
# 5800.times do
#   d = RestClient.get("http://jservice.io/api/clues.json?offset=#{offset}")
#   parsed = JSON.parse(d)
#   parsed.each do |object|
#
#     data.push(object)
#   end
#   offset += parsed.length
# end
#
#
# single_words = data.select{ |clue| clue["answer"].split(" ").length < 2 }
#
# db_words = single_words.select do |word|
#   if word["value"]
#     word["answer"].length == 5 || word["answer"].length == 3 || word["answer"].length == 8
#   end
# end
#
#
# db_words.each{ |word| Word.create(answer: word["answer"], question: word["question"], value: word["value"]) }

puzzle = Puzzle.first
boxIds = puzzle.puzzle_words.map{|w| w.boxId}

puzzle.grid_boxes.each do |box|
  if boxIds.include?(box.boxId)
    box.update(className: "empty numbered")
  elsif box.key == nil
    box.update(className: "filled")
  else
    box.update(className: "empty")
  end
end

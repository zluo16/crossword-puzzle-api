# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# data = []
# offset = 0
# 15000.times do
#   d = RestClient.get("http://jservice.io/api/clues.json?offset=#{offset}")
#   parsed = JSON.parse(d)
#   parsed.each do |object|
#     if object['answer'] != nil && object['question'] != nil
#       data.push(object)
#     end
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

def new_random_puzzle
  puzzle = Puzzle.new_blank_puzzle
  id = puzzle.id
  puzzle.crossword_random_gen

  # while puzzle.puzzle_words.length < 13 || puzzle.grid_boxes.find{|b| b.boxId == 31}.className == 'empty'
  #   puzzle.empty_grid
  #   puzzle = Puzzle.find(id)
  #   puzzle.crossword_random_gen
  # end
end

10.times do
  new_random_puzzle
end

# puzzle = Puzzle.first
# boxIds = puzzle.puzzle_words.map{|w| w.boxId}
#
# maine = Word.find_by(answer: "Maine")
# ore = Word.find_by(answer: "ore")
# wax = Word.find_by(answer: "wax")
# gruff = Word.find_by(answer: "Gruff")
# smirnoff = Word.find_by(answer: "Smirnoff")
# dummy = Word.find_by(answer: "dummy")
# maori = Word.select{|w| w.answer == "Maori"}.last
# angelica = Word.find_by(answer: "Angelica")
# ahi = Word.find_by(answer: "Ahi")
# vault = Word.find_by(answer: "Vault")
# smell = Word.find_by(answer: "smell")
# digit = Word.find_by(answer: "Digit")
# jaw = Word.find_by(answer: "jaw")
#
# words = [
#   { word: maine, alignment: 'across', boxId: 1 },
#   { word: ore, alignment: 'across', boxId: 13 },
#   { word: wax, alignment: 'across', boxId: 16 },
#   { word: gruff, alignment: 'across', boxId: 24 },
#   { word: smirnoff, alignment: 'across', boxId: 36 },
#   { word: dummy, alignment: 'across', boxId: 48 },
#   { word: maori, alignment: 'across', boxId: 71 },
#   { word: angelica, alignment: 'across', boxId: 77 },
#   { word: ahi, alignment: 'across', boxId: 103 },
#   { word: vault, alignment: 'across', boxId: 116 },
#   { word: smell, alignment: 'down', boxId: 36 },
#   { word: digit, alignment: 'down', boxId: 60 },
#   { word: jaw, alignment: 'down', boxId: 69 }
# ]
#
# words.each{ |w| puzzle.add_word(w[:word], w[:alignment], w[:boxId]) }

# puzzle.grid_boxes.each do |box|
#   if boxIds.include?(box.boxId)
#     box.update(className: "empty numbered")
#   elsif box.key == nil || box.key == ""
#     box.update(className: "filled")
#   else
#     box.update(className: "empty")
#   end
# end

class Puzzle < ApplicationRecord
  has_many :grid_boxes
  has_many :puzzle_words
  has_many :words, through: :puzzle_words

  def self.new_blank_puzzle
    puzzle = Puzzle.create
    inc = 1
    while inc < 121
      GridBox.create(boxId: inc, puzzle: puzzle, value: "")
      inc += 1
    end
    puzzle
  end

  def add_word(word, align, boxId)
    PuzzleWord.create(word: word, puzzle: self, alignment: align, boxId: boxId)

    ind = boxId - 1
    word_string = word.answer.upcase

    if align == "across"

      word_string.split("").each do |char|
        box = self.grid_boxes[ind]
        box.update(key: char)
        ind += 1
      end

    else

      word_string.split("").each do |char|
        box = self.grid_boxes[ind]
        box.update(key: char)
        ind += 15
      end

    end
  end

end

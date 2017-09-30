class Puzzle < ApplicationRecord
  has_many :grid_boxes
  has_many :puzzle_words
  has_many :words, through: :puzzle_words

  def self.new_blank_puzzle
    puzzle = Puzzle.create
    inc = 1
    while inc < 121
      GridBox.create(boxId: inc, puzzle: puzzle, key: "", value: "", className: "filled")
      inc += 1
    end
    puzzle
  end

  def empty_grid
    self.grid_boxes.destroy_all
    self.puzzle_words.destroy_all
    inc = 1
    while inc < 121
      GridBox.create(boxId: inc, puzzle: self, key: "", value: "", className: "filled")
      inc += 1
    end
    self
  end

  def add_word(word, align, boxId)
    PuzzleWord.create(word: word, puzzle: self, alignment: align, boxId: boxId)
    grid = self.grid_boxes.sort_by{|b| b.boxId}

    ind = boxId - 1
    word_string = word.answer.upcase

    if align == "across"

      word_string.split("").each do |char|
        box = grid[ind]
        if ind == boxId - 1
          box.update(key: char, className: "empty numbered")
        else
          box.update(key: char, className: "empty")
        end
        ind += 1
      end

    else

      word_string.split("").each do |char|
        box = grid[ind]
        if ind == boxId - 1
          box.update(key: char, className: "empty numbered")
        else
          box.update(key: char, className: "empty")
        end
        ind += 15
      end

    end
  end

  def crossword_random_gen

    one_across = Word.where("LENGTH(answer) = 5").order("RANDOM()").first
    two_across = Word.where("LENGTH(answer) = 3").order("RANDOM()").first
    two_down = Word.get_word([[0, two_across.answer[0]]], 3).shuffle.first
    three_across = Word.where("LENGTH(answer) = 3").order("RANDOM()").first
    four_across = Word.get_word([[4, two_down.answer[1]]], 5).shuffle.first
    five_across = Word.get_word([[7, two_down.answer[2]]], 8).shuffle.first
    five_down = Word.get_word([[0, five_across.answer[0]]], 5).shuffle.first
    six_across = Word.get_word([[3, five_down.answer[1]]], 5).shuffle.first
    seven_down = Word.where("LENGTH(answer) = 5").order("RANDOM()").first
    nine_across = Word.get_word([[4, seven_down.answer[1]]], 5).shuffle.first
    eleven_across = Word.get_word([[2, seven_down.answer[3]]], 3).shuffle.first
    twelve_across = Word.get_word([[4, seven_down.answer[4]]], 5).shuffle.first
    ten_across = Word.get_word([[4, five_down.answer[3]]], 8).shuffle.first
    eight_down = Word.get_word([[1, ten_across.answer[7]]], 3).shuffle.first

    words = [
      { word: one_across, alignment: 'across', boxId: 1 },
      { word: two_across, alignment: 'across', boxId: 13 },
      { word: three_across, alignment: 'across', boxId: 16 },
      { word: four_across, alignment: 'across', boxId: 24 },
      { word: five_across, alignment: 'across', boxId: 36 },
      { word: six_across, alignment: 'across', boxId: 48 },
      { word: nine_across, alignment: 'across', boxId: 71 },
      { word: ten_across, alignment: 'across', boxId: 77 },
      { word: eleven_across, alignment: 'across', boxId: 103 },
      { word: twelve_across, alignment: 'across', boxId: 116 },
      # { word: two_down, alignment: 'down', boxId: 13 },
      { word: five_down, alignment: 'down', boxId: 36 },
      { word: seven_down, alignment: 'down', boxId: 60 },
      { word: eight_down, alignment: 'down', boxId: 69 }
    ]

    words.each{ |word| self.add_word(word[:word], word[:alignment], word[:boxId]) }

    # while self.grid_boxes.find{ |b| b.boxId === 31 }.className === 'empty' || self.puzzle_words.length < 13
    #   self.empty_grid
    #   self.crossword_random_gen
    # end

  end

  def is_valid_crossword
    self.grid_boxes.find{ |b| b.boxId == 31 }.className == "filled"
  end

end

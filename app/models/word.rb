class Word < ApplicationRecord
  has_many :puzzle_words
  has_many :puzzles, through: :puzzle_words

  def self.get_word(arr, length)
    Word.all.select do |w|
      arr.all? do |char|
        w.answer[char[0]] == char[1].downcase || w.answer[char[0]] == char[1].upcase
      end && w.answer.length == length
    end
  end

end

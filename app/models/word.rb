class Word < ApplicationRecord

  def self.get_word(arr, length)
    Word.all.select do |w|
      !arr.any?{|char| w.answer[char[0]] != char[1]} && w.answer.length == length
    end
  end

  private

  def char_in_possitions?(word, arr)
    bool = true
    arr.each do |char|
      word[char[0]] != char[1] ? bool = false : nil
    end
    bool
  end

end

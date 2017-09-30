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

  def self.create_words(offset)
    data = []
    offset = offset
    15000.times do
      d = RestClient.get("http://jservice.io/api/clues.json?offset=#{offset}")
      parsed = JSON.parse(d)
      parsed.each do |object|
        if object['answer'] != nil && object['question'] != nil
          data.push(object)
        end
      end
      offset += parsed.length
    end


    single_words = data.select{ |clue| clue["answer"].split(" ").length < 2 }

    db_words = single_words.select do |word|
      if word["value"]
        word["answer"].length == 5 || word["answer"].length == 3 || word["answer"].length == 8
      end
    end


    db_words.each{ |word| Word.create(answer: word["answer"], question: word["question"], value: word["value"]) }

  end

end

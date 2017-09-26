require 'test_helper'

class PuzzleWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @puzzle_word = puzzle_words(:one)
  end

  test "should get index" do
    get puzzle_words_url, as: :json
    assert_response :success
  end

  test "should create puzzle_word" do
    assert_difference('PuzzleWord.count') do
      post puzzle_words_url, params: { puzzle_word: { puzzle_id: @puzzle_word.puzzle_id, word_id: @puzzle_word.word_id } }, as: :json
    end

    assert_response 201
  end

  test "should show puzzle_word" do
    get puzzle_word_url(@puzzle_word), as: :json
    assert_response :success
  end

  test "should update puzzle_word" do
    patch puzzle_word_url(@puzzle_word), params: { puzzle_word: { puzzle_id: @puzzle_word.puzzle_id, word_id: @puzzle_word.word_id } }, as: :json
    assert_response 200
  end

  test "should destroy puzzle_word" do
    assert_difference('PuzzleWord.count', -1) do
      delete puzzle_word_url(@puzzle_word), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class PuzzlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @puzzle = puzzles(:one)
  end

  test "should get index" do
    get puzzles_url, as: :json
    assert_response :success
  end

  test "should create puzzle" do
    assert_difference('Puzzle.count') do
      post puzzles_url, params: { puzzle: { rating: @puzzle.rating, times_played: @puzzle.times_played } }, as: :json
    end

    assert_response 201
  end

  test "should show puzzle" do
    get puzzle_url(@puzzle), as: :json
    assert_response :success
  end

  test "should update puzzle" do
    patch puzzle_url(@puzzle), params: { puzzle: { rating: @puzzle.rating, times_played: @puzzle.times_played } }, as: :json
    assert_response 200
  end

  test "should destroy puzzle" do
    assert_difference('Puzzle.count', -1) do
      delete puzzle_url(@puzzle), as: :json
    end

    assert_response 204
  end
end

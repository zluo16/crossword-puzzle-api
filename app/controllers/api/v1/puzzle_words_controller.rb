class Api::V1::PuzzleWordsController < ApplicationController
  before_action :set_puzzle_word, only: [:show, :update, :destroy]

  # GET /puzzle_words
  def index
    @puzzle_words = PuzzleWord.all

    render json: @puzzle_words
  end

  # GET /puzzle_words/1
  def show
    render json: @puzzle_word
  end

  # POST /puzzle_words
  def create
    @puzzle_word = PuzzleWord.new(puzzle_word_params)

    if @puzzle_word.save
      render json: @puzzle_word, status: :created, location: @puzzle_word
    else
      render json: @puzzle_word.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /puzzle_words/1
  def update
    if @puzzle_word.update(puzzle_word_params)
      render json: @puzzle_word
    else
      render json: @puzzle_word.errors, status: :unprocessable_entity
    end
  end

  # DELETE /puzzle_words/1
  def destroy
    @puzzle_word.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puzzle_word
      @puzzle_word = PuzzleWord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def puzzle_word_params
      params.require(:puzzle_word).permit(:word_id, :puzzle_id)
    end
end

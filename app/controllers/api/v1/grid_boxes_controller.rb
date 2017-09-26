class Api::V1::GridBoxesController < ApplicationController
  before_action :set_grid_box, only: [:show, :update, :destroy]

  # GET /grid_boxes
  def index
    @grid_boxes = GridBox.all

    render json: @grid_boxes
  end

  # GET /grid_boxes/1
  def show
    render json: @grid_box
  end

  # POST /grid_boxes
  def create
    @grid_box = GridBox.new(grid_box_params)

    if @grid_box.save
      render json: @grid_box, status: :created, location: @grid_box
    else
      render json: @grid_box.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grid_boxes/1
  def update
    if @grid_box.update(grid_box_params)
      render json: @grid_box
    else
      render json: @grid_box.errors, status: :unprocessable_entity
    end
  end

  # DELETE /grid_boxes/1
  def destroy
    @grid_box.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grid_box
      @grid_box = GridBox.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grid_box_params
      params.require(:grid_box).permit(:boxId, :type, :key, :value)
    end
end

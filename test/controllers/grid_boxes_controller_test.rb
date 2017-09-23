require 'test_helper'

class GridBoxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grid_box = grid_boxes(:one)
  end

  test "should get index" do
    get grid_boxes_url, as: :json
    assert_response :success
  end

  test "should create grid_box" do
    assert_difference('GridBox.count') do
      post grid_boxes_url, params: { grid_box: { boxId: @grid_box.boxId, key: @grid_box.key, type: @grid_box.type, value: @grid_box.value } }, as: :json
    end

    assert_response 201
  end

  test "should show grid_box" do
    get grid_box_url(@grid_box), as: :json
    assert_response :success
  end

  test "should update grid_box" do
    patch grid_box_url(@grid_box), params: { grid_box: { boxId: @grid_box.boxId, key: @grid_box.key, type: @grid_box.type, value: @grid_box.value } }, as: :json
    assert_response 200
  end

  test "should destroy grid_box" do
    assert_difference('GridBox.count', -1) do
      delete grid_box_url(@grid_box), as: :json
    end

    assert_response 204
  end
end

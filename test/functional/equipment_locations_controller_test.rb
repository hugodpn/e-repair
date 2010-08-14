require 'test_helper'

class EquipmentLocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment_location" do
    assert_difference('EquipmentLocation.count') do
      post :create, :equipment_location => { }
    end

    assert_redirected_to equipment_location_path(assigns(:equipment_location))
  end

  test "should show equipment_location" do
    get :show, :id => equipment_locations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => equipment_locations(:one).to_param
    assert_response :success
  end

  test "should update equipment_location" do
    put :update, :id => equipment_locations(:one).to_param, :equipment_location => { }
    assert_redirected_to equipment_location_path(assigns(:equipment_location))
  end

  test "should destroy equipment_location" do
    assert_difference('EquipmentLocation.count', -1) do
      delete :destroy, :id => equipment_locations(:one).to_param
    end

    assert_redirected_to equipment_locations_path
  end
end

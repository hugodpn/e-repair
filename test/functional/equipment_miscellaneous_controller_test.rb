require 'test_helper'

class EquipmentMiscellaneousControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment_miscellaneous)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment_miscellaneou" do
    assert_difference('EquipmentMiscellaneou.count') do
      post :create, :equipment_miscellaneou => { }
    end

    assert_redirected_to equipment_miscellaneou_path(assigns(:equipment_miscellaneou))
  end

  test "should show equipment_miscellaneou" do
    get :show, :id => equipment_miscellaneous(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => equipment_miscellaneous(:one).to_param
    assert_response :success
  end

  test "should update equipment_miscellaneou" do
    put :update, :id => equipment_miscellaneous(:one).to_param, :equipment_miscellaneou => { }
    assert_redirected_to equipment_miscellaneou_path(assigns(:equipment_miscellaneou))
  end

  test "should destroy equipment_miscellaneou" do
    assert_difference('EquipmentMiscellaneou.count', -1) do
      delete :destroy, :id => equipment_miscellaneous(:one).to_param
    end

    assert_redirected_to equipment_miscellaneous_path
  end
end

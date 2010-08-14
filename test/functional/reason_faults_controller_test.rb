require 'test_helper'

class ReasonFaultsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reason_faults)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reason_fault" do
    assert_difference('ReasonFault.count') do
      post :create, :reason_fault => { }
    end

    assert_redirected_to reason_fault_path(assigns(:reason_fault))
  end

  test "should show reason_fault" do
    get :show, :id => reason_faults(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => reason_faults(:one).to_param
    assert_response :success
  end

  test "should update reason_fault" do
    put :update, :id => reason_faults(:one).to_param, :reason_fault => { }
    assert_redirected_to reason_fault_path(assigns(:reason_fault))
  end

  test "should destroy reason_fault" do
    assert_difference('ReasonFault.count', -1) do
      delete :destroy, :id => reason_faults(:one).to_param
    end

    assert_redirected_to reason_faults_path
  end
end

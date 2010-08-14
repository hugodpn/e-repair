require 'test_helper'

class RequestRepairsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_repairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_repair" do
    assert_difference('RequestRepair.count') do
      post :create, :request_repair => { }
    end

    assert_redirected_to request_repair_path(assigns(:request_repair))
  end

  test "should show request_repair" do
    get :show, :id => request_repairs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => request_repairs(:one).to_param
    assert_response :success
  end

  test "should update request_repair" do
    put :update, :id => request_repairs(:one).to_param, :request_repair => { }
    assert_redirected_to request_repair_path(assigns(:request_repair))
  end

  test "should destroy request_repair" do
    assert_difference('RequestRepair.count', -1) do
      delete :destroy, :id => request_repairs(:one).to_param
    end

    assert_redirected_to request_repairs_path
  end
end

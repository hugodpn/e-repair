require 'test_helper'

class RepairsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair" do
    assert_difference('Repair.count') do
      post :create, :repair => { }
    end

    assert_redirected_to repair_path(assigns(:repair))
  end

  test "should show repair" do
    get :show, :id => repairs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => repairs(:one).to_param
    assert_response :success
  end

  test "should update repair" do
    put :update, :id => repairs(:one).to_param, :repair => { }
    assert_redirected_to repair_path(assigns(:repair))
  end

  test "should destroy repair" do
    assert_difference('Repair.count', -1) do
      delete :destroy, :id => repairs(:one).to_param
    end

    assert_redirected_to repairs_path
  end
end

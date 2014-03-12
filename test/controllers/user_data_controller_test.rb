require 'test_helper'

class UserDataControllerTest < ActionController::TestCase
  setup do
    @user_data = user_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_datum" do
    assert_difference('UserDatum.count') do
      post :create, user_data: { contact: @user_data.contact, description: @user_data.description, email: @user_data.email, is_activated: @user_data.is_activated, name: @user_data.name }
    end

    assert_redirected_to user_datum_path(assigns(:user_data))
  end

  test "should show user_datum" do
    get :show, id: @user_data
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_data
    assert_response :success
  end

  test "should update user_datum" do
    patch :update, id: @user_data, user_data: { contact: @user_data.contact, description: @user_data.description, email: @user_data.email, is_activated: @user_data.is_activated, name: @user_data.name }
    assert_redirected_to user_datum_path(assigns(:user_data))
  end

  test "should destroy user_datum" do
    assert_difference('UserDatum.count', -1) do
      delete :destroy, id: @user_data
    end

    assert_redirected_to user_data_path
  end
end

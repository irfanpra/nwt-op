require 'test_helper'

class PasswordRecoveryTokensControllerTest < ActionController::TestCase
  setup do
    @password_recovery_token = password_recovery_tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:password_recovery_tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create password_recovery_token" do
    assert_difference('PasswordRecoveryToken.count') do
      post :create, password_recovery_token: { token: @password_recovery_token.token }
    end

    assert_redirected_to password_recovery_token_path(assigns(:password_recovery_token))
  end

  test "should show password_recovery_token" do
    get :show, id: @password_recovery_token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @password_recovery_token
    assert_response :success
  end

  test "should update password_recovery_token" do
    patch :update, id: @password_recovery_token, password_recovery_token: { token: @password_recovery_token.token }
    assert_redirected_to password_recovery_token_path(assigns(:password_recovery_token))
  end

  test "should destroy password_recovery_token" do
    assert_difference('PasswordRecoveryToken.count', -1) do
      delete :destroy, id: @password_recovery_token
    end

    assert_redirected_to password_recovery_tokens_path
  end
end

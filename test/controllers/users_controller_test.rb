require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:brian)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    #Destroy user created because for some reason when we create the temp user in the setup method above it creates the same user and it cannot be remade
    User.destroy(890002738)
    assert_difference('User.count') do
      post users_url, params: { user: { admin: @user.admin, email: @user.email, fname: @user.fname, lname: @user.lname, password: "password", status: @user.status, username: @user.username } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { admin: @user.admin, email: @user.email, fname: @user.fname, lname: @user.lname, password: "password", password_confirmation: "password", status: @user.status, username: @user.username } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end

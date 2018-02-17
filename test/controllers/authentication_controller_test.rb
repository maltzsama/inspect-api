require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest

  test "Create user" do
    post '/user/sign_up', params: { user: {email: "john@doe.com",
      password: "John Doe", 
      password_confirmation: "John Doe",
      name: "John Doe",
      bio: "test about that to see" }}
    
    assert_response :success
  end

  test "Create user fail" do
    post '/user/sign_up', params: { user: {
      password: "John Doe", 
      password_confirmation: "John Doe",
      name: "John Doe",
      bio: "test about that to see" }}
    assert_response :unprocessable_entity
  end
end
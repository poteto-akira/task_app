require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login with invalid information" do
    get login_path
    assert_template "login"
    post login_path, params: { session: { username:"", password:""}}
    assert_template "login"
    assert_not flash.empty?
    get root_path
    asset flash.empty?
  end
end

require 'test_helper'

class OcurrencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ocurrences_index_url
    assert_response :success
  end

  test "should get post" do
    get ocurrences_post_url
    assert_response :success
  end

  test "should get patch" do
    get ocurrences_patch_url
    assert_response :success
  end

  test "should get put" do
    get ocurrences_put_url
    assert_response :success
  end

  test "should get delete" do
    get ocurrences_delete_url
    assert_response :success
  end

end

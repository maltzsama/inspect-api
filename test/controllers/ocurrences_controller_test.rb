require 'test_helper'

class OccurrencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get occurrences_index_url
    assert_response :success
  end

  test "should get post" do
    get occurrence_post_url
    assert_response :success
  end

  test "should get patch" do
    get occurrence_patch_url
    assert_response :success
  end

  test "should get put" do
    get occurrence_put_url
    assert_response :success
  end

  test "should get delete" do
    get occurrence_delete_url
    assert_response :success
  end

end

require 'test_helper'

class FeedItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feed_items_index_url
    assert_response :success
  end

  test "should get show" do
    get feed_items_show_url
    assert_response :success
  end

end

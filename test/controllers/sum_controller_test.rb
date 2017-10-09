require 'test_helper'

class SumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sum_index_url
    assert_response :success
  end

end

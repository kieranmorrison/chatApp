require 'test_helper'

class WaitQueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wait_queue = wait_queues(:one)
  end

  test "should get index" do
    get wait_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_wait_queue_url
    assert_response :success
  end

  test "should create wait_queue" do
    assert_difference('WaitQueue.count') do
      post wait_queues_url, params: { wait_queue: { dateTimeAdded: @wait_queue.dateTimeAdded, user_id: @wait_queue.user_id } }
    end

    assert_redirected_to wait_queue_url(WaitQueue.last)
  end

  test "should show wait_queue" do
    get wait_queue_url(@wait_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_wait_queue_url(@wait_queue)
    assert_response :success
  end

  test "should update wait_queue" do
    patch wait_queue_url(@wait_queue), params: { wait_queue: { dateTimeAdded: @wait_queue.dateTimeAdded, user_id: @wait_queue.user_id } }
    assert_redirected_to wait_queue_url(@wait_queue)
  end

  test "should destroy wait_queue" do
    assert_difference('WaitQueue.count', -1) do
      delete wait_queue_url(@wait_queue)
    end

    assert_redirected_to wait_queues_url
  end
end

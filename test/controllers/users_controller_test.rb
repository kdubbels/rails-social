require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should show user" do
    user = users(:user1)

    get :show, id: user.id
    assert assigns(:user)
  	assert_response :success
  end

  test "should follow user" do
    user1 = users(:user1)
    user2 = users(:user2)

    get :follow, { id: user2.id }, { user_id: user1.id }

    assert user1.following? user2
    assert_redirected_to user_url(user2)  	
  end
end
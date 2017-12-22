require 'test_helper'

class Event::SignupsControllerTest < ActionController::TestCase
  setup do
    @event_signup = event_signups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_signups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_signup" do
    assert_difference('Event::Signup.count') do
      post :create, event_signup: {  }
    end

    assert_redirected_to event_signup_path(assigns(:event_signup))
  end

  test "should show event_signup" do
    get :show, id: @event_signup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_signup
    assert_response :success
  end

  test "should update event_signup" do
    patch :update, id: @event_signup, event_signup: {  }
    assert_redirected_to event_signup_path(assigns(:event_signup))
  end

  test "should destroy event_signup" do
    assert_difference('Event::Signup.count', -1) do
      delete :destroy, id: @event_signup
    end

    assert_redirected_to event_signups_path
  end
end

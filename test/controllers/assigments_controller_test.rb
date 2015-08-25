require 'test_helper'

class AssigmentsControllerTest < ActionController::TestCase
  setup do
    @assigment = assigments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assigments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assigment" do
    assert_difference('Assigment.count') do
      post :create, assigment: { description: @assigment.description, due_time: @assigment.due_time, title: @assigment.title, topic_id: @assigment.topic_id }
    end

    assert_redirected_to assigment_path(assigns(:assigment))
  end

  test "should show assigment" do
    get :show, id: @assigment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assigment
    assert_response :success
  end

  test "should update assigment" do
    patch :update, id: @assigment, assigment: { description: @assigment.description, due_time: @assigment.due_time, title: @assigment.title, topic_id: @assigment.topic_id }
    assert_redirected_to assigment_path(assigns(:assigment))
  end

  test "should destroy assigment" do
    assert_difference('Assigment.count', -1) do
      delete :destroy, id: @assigment
    end

    assert_redirected_to assigments_path
  end
end

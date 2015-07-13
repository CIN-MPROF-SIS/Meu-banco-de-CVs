require 'test_helper'

class LinguasControllerTest < ActionController::TestCase
  setup do
    @lingua = linguas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linguas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lingua" do
    assert_difference('Lingua.count') do
      post :create, lingua: { descricao: @lingua.descricao }
    end

    assert_redirected_to lingua_path(assigns(:lingua))
  end

  test "should show lingua" do
    get :show, id: @lingua
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lingua
    assert_response :success
  end

  test "should update lingua" do
    patch :update, id: @lingua, lingua: { descricao: @lingua.descricao }
    assert_redirected_to lingua_path(assigns(:lingua))
  end

  test "should destroy lingua" do
    assert_difference('Lingua.count', -1) do
      delete :destroy, id: @lingua
    end

    assert_redirected_to linguas_path
  end
end

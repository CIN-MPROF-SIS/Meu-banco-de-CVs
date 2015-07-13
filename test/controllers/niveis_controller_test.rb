require 'test_helper'

class NiveisControllerTest < ActionController::TestCase
  setup do
    @nivel = niveis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:niveis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nivel" do
    assert_difference('Nivel.count') do
      post :create, nivel: { descricao: @nivel.descricao }
    end

    assert_redirected_to nivel_path(assigns(:nivel))
  end

  test "should show nivel" do
    get :show, id: @nivel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nivel
    assert_response :success
  end

  test "should update nivel" do
    patch :update, id: @nivel, nivel: { descricao: @nivel.descricao }
    assert_redirected_to nivel_path(assigns(:nivel))
  end

  test "should destroy nivel" do
    assert_difference('Nivel.count', -1) do
      delete :destroy, id: @nivel
    end

    assert_redirected_to niveis_path
  end
end

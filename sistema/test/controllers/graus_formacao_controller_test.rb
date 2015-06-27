require 'test_helper'

class GrausFormacaoControllerTest < ActionController::TestCase
  setup do
    @grau_formacao = graus_formacao(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graus_formacao)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grau_formacao" do
    assert_difference('GrauFormacao.count') do
      post :create, grau_formacao: { descricao: @grau_formacao.descricao }
    end

    assert_redirected_to grau_formacao_path(assigns(:grau_formacao))
  end

  test "should show grau_formacao" do
    get :show, id: @grau_formacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grau_formacao
    assert_response :success
  end

  test "should update grau_formacao" do
    patch :update, id: @grau_formacao, grau_formacao: { descricao: @grau_formacao.descricao }
    assert_redirected_to grau_formacao_path(assigns(:grau_formacao))
  end

  test "should destroy grau_formacao" do
    assert_difference('GrauFormacao.count', -1) do
      delete :destroy, id: @grau_formacao
    end

    assert_redirected_to graus_formacao_path
  end
end

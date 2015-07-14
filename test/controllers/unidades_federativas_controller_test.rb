require 'test_helper'

class UnidadesFederativasControllerTest < ActionController::TestCase
  setup do
    @unidade_federativa = unidades_federativas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unidades_federativas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unidade_federativa" do
    assert_difference('UnidadeFederativa.count') do
      post :create, unidade_federativa: { nome: @unidade_federativa.nome, sigla: @unidade_federativa.sigla }
    end

    assert_redirected_to unidade_federativa_path(assigns(:unidade_federativa))
  end

  test "should show unidade_federativa" do
    get :show, id: @unidade_federativa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unidade_federativa
    assert_response :success
  end

  test "should update unidade_federativa" do
    patch :update, id: @unidade_federativa, unidade_federativa: { nome: @unidade_federativa.nome, sigla: @unidade_federativa.sigla }
    assert_redirected_to unidade_federativa_path(assigns(:unidade_federativa))
  end

  test "should destroy unidade_federativa" do
    assert_difference('UnidadeFederativa.count', -1) do
      delete :destroy, id: @unidade_federativa
    end

    assert_redirected_to unidades_federativas_path
  end
end

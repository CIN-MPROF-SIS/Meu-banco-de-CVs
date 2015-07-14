require 'test_helper'

class ModeradoresControllerTest < ActionController::TestCase
  setup do
    @moderador = moderadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moderadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moderador" do
    assert_difference('Moderador.count') do
      post :create, moderador: { cep: @moderador.cep, cidade_id: @moderador.cidade_id, complemento: @moderador.complemento, email: @moderador.email, logradouro: @moderador.logradouro, nome: @moderador.nome, numero: @moderador.numero, telefone: @moderador.telefone }
    end

    assert_redirected_to moderador_path(assigns(:moderador))
  end

  test "should show moderador" do
    get :show, id: @moderador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moderador
    assert_response :success
  end

  test "should update moderador" do
    patch :update, id: @moderador, moderador: { cep: @moderador.cep, cidade_id: @moderador.cidade_id, complemento: @moderador.complemento, email: @moderador.email, logradouro: @moderador.logradouro, nome: @moderador.nome, numero: @moderador.numero, telefone: @moderador.telefone }
    assert_redirected_to moderador_path(assigns(:moderador))
  end

  test "should destroy moderador" do
    assert_difference('Moderador.count', -1) do
      delete :destroy, id: @moderador
    end

    assert_redirected_to moderadores_path
  end
end

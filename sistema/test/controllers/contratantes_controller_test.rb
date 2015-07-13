require 'test_helper'

class ContratantesControllerTest < ActionController::TestCase
  setup do
    @contratante = contratantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contratantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contratante" do
    assert_difference('Contratante.count') do
      post :create, contratante: { autorizado: @contratante.autorizado, bairro: @contratante.bairro, cep: @contratante.cep, cnpj: @contratante.cnpj, complemento: @contratante.complemento, email: @contratante.email, inscricaoEstadual: @contratante.inscricaoEstadual, logo: @contratante.logo, logradouro: @contratante.logradouro, municipio_id: @contratante.municipio_id, nome: @contratante.nome, numero: @contratante.numero, telefone: @contratante.telefone }
    end

    assert_redirected_to contratante_path(assigns(:contratante))
  end

  test "should show contratante" do
    get :show, id: @contratante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contratante
    assert_response :success
  end

  test "should update contratante" do
    patch :update, id: @contratante, contratante: { autorizado: @contratante.autorizado, bairro: @contratante.bairro, cep: @contratante.cep, cnpj: @contratante.cnpj, complemento: @contratante.complemento, email: @contratante.email, inscricaoEstadual: @contratante.inscricaoEstadual, logo: @contratante.logo, logradouro: @contratante.logradouro, municipio_id: @contratante.municipio_id, nome: @contratante.nome, numero: @contratante.numero, telefone: @contratante.telefone }
    assert_redirected_to contratante_path(assigns(:contratante))
  end

  test "should destroy contratante" do
    assert_difference('Contratante.count', -1) do
      delete :destroy, id: @contratante
    end

    assert_redirected_to contratantes_path
  end
end

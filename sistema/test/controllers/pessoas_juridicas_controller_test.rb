require 'test_helper'

class PessoasJuridicasControllerTest < ActionController::TestCase
  setup do
    @pessoa_juridica = pessoas_juridicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pessoas_juridicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pessoa_juridica" do
    assert_difference('PessoaJuridica.count') do
      post :create, pessoa_juridica: { autorizado: @pessoa_juridica.autorizado, cep: @pessoa_juridica.cep, cnpj: @pessoa_juridica.cnpj, complemento: @pessoa_juridica.complemento, email: @pessoa_juridica.email, inscricaoEstagual: @pessoa_juridica.inscricaoEstagual, logo: @pessoa_juridica.logo, logradouro: @pessoa_juridica.logradouro, municipio_id: @pessoa_juridica.municipio_id, nome: @pessoa_juridica.nome, numero: @pessoa_juridica.numero, telefone: @pessoa_juridica.telefone }
    end

    assert_redirected_to pessoa_juridica_path(assigns(:pessoa_juridica))
  end

  test "should show pessoa_juridica" do
    get :show, id: @pessoa_juridica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pessoa_juridica
    assert_response :success
  end

  test "should update pessoa_juridica" do
    patch :update, id: @pessoa_juridica, pessoa_juridica: { autorizado: @pessoa_juridica.autorizado, cep: @pessoa_juridica.cep, cnpj: @pessoa_juridica.cnpj, complemento: @pessoa_juridica.complemento, email: @pessoa_juridica.email, inscricaoEstagual: @pessoa_juridica.inscricaoEstagual, logo: @pessoa_juridica.logo, logradouro: @pessoa_juridica.logradouro, municipio_id: @pessoa_juridica.municipio_id, nome: @pessoa_juridica.nome, numero: @pessoa_juridica.numero, telefone: @pessoa_juridica.telefone }
    assert_redirected_to pessoa_juridica_path(assigns(:pessoa_juridica))
  end

  test "should destroy pessoa_juridica" do
    assert_difference('PessoaJuridica.count', -1) do
      delete :destroy, id: @pessoa_juridica
    end

    assert_redirected_to pessoas_juridicas_path
  end
end

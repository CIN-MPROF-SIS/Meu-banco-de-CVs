require 'test_helper'

class PessoasFisicasControllerTest < ActionController::TestCase
  setup do
    @pessoa_fisica = pessoas_fisicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pessoas_fisicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pessoa_fisica" do
    assert_difference('PessoaFisica.count') do
      post :create, pessoa_fisica: { cep: @pessoa_fisica.cep, cidade_id: @pessoa_fisica.cidade_id, complemento: @pessoa_fisica.complemento, cpf: @pessoa_fisica.cpf, dataNascimento: @pessoa_fisica.dataNascimento, email: @pessoa_fisica.email, foto: @pessoa_fisica.foto, logradouro: @pessoa_fisica.logradouro, nacionalidade: @pessoa_fisica.nacionalidade, naturalidade_id: @pessoa_fisica.naturalidade_id, nome: @pessoa_fisica.nome, numero: @pessoa_fisica.numero, telefone: @pessoa_fisica.telefone }
    end

    assert_redirected_to pessoa_fisica_path(assigns(:pessoa_fisica))
  end

  test "should show pessoa_fisica" do
    get :show, id: @pessoa_fisica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pessoa_fisica
    assert_response :success
  end

  test "should update pessoa_fisica" do
    patch :update, id: @pessoa_fisica, pessoa_fisica: { cep: @pessoa_fisica.cep, cidade_id: @pessoa_fisica.cidade_id, complemento: @pessoa_fisica.complemento, cpf: @pessoa_fisica.cpf, dataNascimento: @pessoa_fisica.dataNascimento, email: @pessoa_fisica.email, foto: @pessoa_fisica.foto, logradouro: @pessoa_fisica.logradouro, nacionalidade: @pessoa_fisica.nacionalidade, naturalidade_id: @pessoa_fisica.naturalidade_id, nome: @pessoa_fisica.nome, numero: @pessoa_fisica.numero, telefone: @pessoa_fisica.telefone }
    assert_redirected_to pessoa_fisica_path(assigns(:pessoa_fisica))
  end

  test "should destroy pessoa_fisica" do
    assert_difference('PessoaFisica.count', -1) do
      delete :destroy, id: @pessoa_fisica
    end

    assert_redirected_to pessoas_fisicas_path
  end
end

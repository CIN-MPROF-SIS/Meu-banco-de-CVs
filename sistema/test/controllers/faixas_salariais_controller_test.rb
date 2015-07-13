require 'test_helper'

class FaixasSalariaisControllerTest < ActionController::TestCase
  setup do
    @faixa_salarial = faixas_salariais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faixas_salariais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faixa_salarial" do
    assert_difference('FaixaSalarial.count') do
      post :create, faixa_salarial: { valor: @faixa_salarial.valor }
    end

    assert_redirected_to faixa_salarial_path(assigns(:faixa_salarial))
  end

  test "should show faixa_salarial" do
    get :show, id: @faixa_salarial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faixa_salarial
    assert_response :success
  end

  test "should update faixa_salarial" do
    patch :update, id: @faixa_salarial, faixa_salarial: { valor: @faixa_salarial.valor }
    assert_redirected_to faixa_salarial_path(assigns(:faixa_salarial))
  end

  test "should destroy faixa_salarial" do
    assert_difference('FaixaSalarial.count', -1) do
      delete :destroy, id: @faixa_salarial
    end

    assert_redirected_to faixas_salariais_path
  end
end

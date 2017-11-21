require 'test_helper'

class CalourosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calouro = calouros(:one)
  end

  test "should get index" do
    get calouros_url
    assert_response :success
  end

  test "should get new" do
    get new_calouro_url
    assert_response :success
  end

  test "should create calouro" do
    assert_difference('Calouro.count') do
      post calouros_url, params: { calouro: { idade: @calouro.idade, nome: @calouro.nome } }
    end

    assert_redirected_to calouro_url(Calouro.last)
  end

  test "should show calouro" do
    get calouro_url(@calouro)
    assert_response :success
  end

  test "should get edit" do
    get edit_calouro_url(@calouro)
    assert_response :success
  end

  test "should update calouro" do
    patch calouro_url(@calouro), params: { calouro: { idade: @calouro.idade, nome: @calouro.nome } }
    assert_redirected_to calouro_url(@calouro)
  end

  test "should destroy calouro" do
    assert_difference('Calouro.count', -1) do
      delete calouro_url(@calouro)
    end

    assert_redirected_to calouros_url
  end
end

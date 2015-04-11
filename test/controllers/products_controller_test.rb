require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { application: @product.application, awg: @product.awg, carton_quantity: @product.carton_quantity, compound: @product.compound, length: @product.length, nec_article: @product.nec_article, nom_od: @product.nom_od, pairs_count: @product.pairs_count, product_code: @product.product_code, putup: @product.putup, shielded: @product.shielded, solid: @product.solid, stand_count: @product.stand_count, strand_type: @product.strand_type, stranded: @product.stranded, unit_copper_weight: @product.unit_copper_weight, unit_weight_kgs: @product.unit_weight_kgs, unit_weight_lbs: @product.unit_weight_lbs, upg_description: @product.upg_description }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { application: @product.application, awg: @product.awg, carton_quantity: @product.carton_quantity, compound: @product.compound, length: @product.length, nec_article: @product.nec_article, nom_od: @product.nom_od, pairs_count: @product.pairs_count, product_code: @product.product_code, putup: @product.putup, shielded: @product.shielded, solid: @product.solid, stand_count: @product.stand_count, strand_type: @product.strand_type, stranded: @product.stranded, unit_copper_weight: @product.unit_copper_weight, unit_weight_kgs: @product.unit_weight_kgs, unit_weight_lbs: @product.unit_weight_lbs, upg_description: @product.upg_description }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end

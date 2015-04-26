class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index

    # get the gauges to choose from
    @gauges = Product.gauges

    @device = detect_browser()

    # get the applications to choose from
    @applications = Product.applications

    @products = Product.all

    prod_params = params[:product]
    @selected_app = ""
    @selected_awg = ""

    if prod_params != nil
      if prod_params["selected_app"] != nil
        @selected_app = prod_params["selected_app"]
        @products = @products.single_application(@selected_app)
        logger.debug "products single app: #{@products.inspect}"
      end
      if prod_params["selected_awg"] != nil
        @selected_awg = prod_params["selected_awg"]
        @products = @products.single_gauge(@selected_awg)
        logger.debug "products single gauge: #{@products.inspect}"
      end

      #params[:page] = prod_params["page"] if params[:page] == nil

    end

    @search_terms = params["search_terms"] unless params["search_terms"] == nil

    if params[:page] == nil
      @products = @products.search(params["search_terms"], 1)
      @page = 1
    else
      @products = @products.search(params["search_terms"], params[:page])
      @page = params[:page]
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_code, :upg_description, :compound, :nec_article, :shielded, :application, :strand_type, :pairs_count, :awg, :stand_count, :stranded, :solid, :putup, :length, :unit_weight_lbs, :unit_weight_kgs, :nom_od, :unit_copper_weight, :carton_quantity, :selected_app)
    end
end

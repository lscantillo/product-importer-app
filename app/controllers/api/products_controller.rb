# frozen_string_literal: true

module Api
  class ProductsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_product, only: %i[show edit update destroy]
    before_action :upload_csv_params, only: [:upload]

    # POST /products/upload
    def upload
      csv = params[:csv]
      file_name = "/tmp/temp#{SecureRandom.hex(10)}.csv"
      CsvService::CleanCsv.clean_file(csv.path, file_name)
      CsvUploader::UploadWorker.perform_async(file_name)
      render json: { message: 'Products have been uploaded!' }, status: :ok
    end

    # GET /products or /products.json
    def index
      @products = Product.all

      render json: @products
    end

    # GET /products/1 or /products/1.json
    def show; end

    # GET /products/new
    def new
      @product = Product.new
    end

    # GET /products/1/edit
    def edit; end

    # POST /products or /products.json
    def create
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save

          format.json { render json: @product, status: :created }
        else

          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /products/1 or /products/1.json
    def update
      respond_to do |format|
        if @product.update(product_params)

          format.json { render json: @product, status: :ok }
        else

          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1 or /products/1.json
    def destroy
      @product.destroy

      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.permit(:name, :price, :expiration, :currency_id)
    end

    def upload_csv_params
      params.permit(:csv)
    end
  end
end

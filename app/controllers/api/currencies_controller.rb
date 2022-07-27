# frozen_string_literal: true

module Api
  class CurrenciesController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_currency, only: %i[show edit update destroy]

    # GET /currencies or /currencies.json
    def index
      @currencies = Currency.all
      render json: @currencies
    end

    # GET /currencies/1 or /currencies/1.json
    def show; end

    # GET /currencies/new
    def new
      @currency = Currency.new
    end

    # GET /currencies/1/edit
    def edit; end

    # POST /currencies or /currencies.json
    def create
      @currency = Currency.new(currency_params)

      respond_to do |format|
        if @currency.save
          format.json { render json: @currency, status: :created }
        else
          format.json { render json: @currency.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /currencies/1 or /currencies/1.json
    def update
      respond_to do |format|
        if @currency.update(currency_params)
          format.json { render json: @currency, status: :ok }
        else
          format.json { render json: @currency.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /currencies/1 or /currencies/1.json
    def destroy
      @currency.destroy

      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def currency_params
      params.permit(:name, :currency_code)
    end
  end
end

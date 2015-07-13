class FaixasSalariaisController < ApplicationController
  before_action :set_faixa_salarial, only: [:show, :edit, :update, :destroy]

  # GET /faixas_salariais
  # GET /faixas_salariais.json
  def index
    @faixas_salariais = FaixaSalarial.all
  end

  # GET /faixas_salariais/1
  # GET /faixas_salariais/1.json
  def show
  end

  # GET /faixas_salariais/new
  def new
    @faixa_salarial = FaixaSalarial.new
  end

  # GET /faixas_salariais/1/edit
  def edit
  end

  # POST /faixas_salariais
  # POST /faixas_salariais.json
  def create
    @faixa_salarial = FaixaSalarial.new(faixa_salarial_params)

    respond_to do |format|
      if @faixa_salarial.save
        format.html { redirect_to @faixa_salarial, notice: 'Faixa salarial was successfully created.' }
        format.json { render :show, status: :created, location: @faixa_salarial }
      else
        format.html { render :new }
        format.json { render json: @faixa_salarial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faixas_salariais/1
  # PATCH/PUT /faixas_salariais/1.json
  def update
    respond_to do |format|
      if @faixa_salarial.update(faixa_salarial_params)
        format.html { redirect_to @faixa_salarial, notice: 'Faixa salarial was successfully updated.' }
        format.json { render :show, status: :ok, location: @faixa_salarial }
      else
        format.html { render :edit }
        format.json { render json: @faixa_salarial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faixas_salariais/1
  # DELETE /faixas_salariais/1.json
  def destroy
    @faixa_salarial.destroy
    respond_to do |format|
      format.html { redirect_to faixas_salariais_url, notice: 'Faixa salarial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faixa_salarial
      @faixa_salarial = FaixaSalarial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faixa_salarial_params
      params.require(:faixa_salarial).permit(:valor)
    end
end

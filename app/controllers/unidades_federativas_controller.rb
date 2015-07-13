class UnidadesFederativasController < ApplicationController
  before_action :set_unidade_federativa, only: [:show, :edit, :update, :destroy]

  # GET /unidades_federativas
  # GET /unidades_federativas.json
  def index
    @unidades_federativas = UnidadeFederativa.all
  end

  # GET /unidades_federativas/1
  # GET /unidades_federativas/1.json
  def show
  end

  # GET /unidades_federativas/new
  def new
    @unidade_federativa = UnidadeFederativa.new
  end

  # GET /unidades_federativas/1/edit
  def edit
  end

  # POST /unidades_federativas
  # POST /unidades_federativas.json
  def create
    @unidade_federativa = UnidadeFederativa.new(unidade_federativa_params)

    respond_to do |format|
      if @unidade_federativa.save
        format.html { redirect_to @unidade_federativa, notice: 'Unidade federativa was successfully created.' }
        format.json { render :show, status: :created, location: @unidade_federativa }
      else
        format.html { render :new }
        format.json { render json: @unidade_federativa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidades_federativas/1
  # PATCH/PUT /unidades_federativas/1.json
  def update
    respond_to do |format|
      if @unidade_federativa.update(unidade_federativa_params)
        format.html { redirect_to @unidade_federativa, notice: 'Unidade federativa was successfully updated.' }
        format.json { render :show, status: :ok, location: @unidade_federativa }
      else
        format.html { render :edit }
        format.json { render json: @unidade_federativa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades_federativas/1
  # DELETE /unidades_federativas/1.json
  def destroy
    @unidade_federativa.destroy
    respond_to do |format|
      format.html { redirect_to unidades_federativas_url, notice: 'Unidade federativa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade_federativa
      @unidade_federativa = UnidadeFederativa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unidade_federativa_params
      params.require(:unidade_federativa).permit(:sigla, :nome)
    end
end

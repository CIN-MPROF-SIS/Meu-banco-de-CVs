class GrausFormacaoController < ApplicationController
  before_action :set_grau_formacao, only: [:show, :edit, :update, :destroy]

  # GET /graus_formacao
  # GET /graus_formacao.json
  def index
    @graus_formacao = GrauFormacao.all
  end

  # GET /graus_formacao/1
  # GET /graus_formacao/1.json
  def show
  end

  # GET /graus_formacao/new
  def new
    @grau_formacao = GrauFormacao.new
  end

  # GET /graus_formacao/1/edit
  def edit
  end

  # POST /graus_formacao
  # POST /graus_formacao.json
  def create
    @grau_formacao = GrauFormacao.new(grau_formacao_params)

    respond_to do |format|
      if @grau_formacao.save
        format.html { redirect_to @grau_formacao, notice: 'Grau formacao was successfully created.' }
        format.json { render :show, status: :created, location: @grau_formacao }
      else
        format.html { render :new }
        format.json { render json: @grau_formacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graus_formacao/1
  # PATCH/PUT /graus_formacao/1.json
  def update
    respond_to do |format|
      if @grau_formacao.update(grau_formacao_params)
        format.html { redirect_to @grau_formacao, notice: 'Grau formacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @grau_formacao }
      else
        format.html { render :edit }
        format.json { render json: @grau_formacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graus_formacao/1
  # DELETE /graus_formacao/1.json
  def destroy
    @grau_formacao.destroy
    respond_to do |format|
      format.html { redirect_to graus_formacao_url, notice: 'Grau formacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grau_formacao
      @grau_formacao = GrauFormacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grau_formacao_params
      params.require(:grau_formacao).permit(:descricao)
    end
end

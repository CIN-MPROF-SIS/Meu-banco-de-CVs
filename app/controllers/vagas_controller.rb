class VagasController < ApplicationController
  before_action :set_vaga, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :create, :update, :show ,:new, :edit, :update, :destroy]
  before_action :require_contratante, only: [:index, :update, :create, :new, :edit, :update, :destroy]
  before_action :require_ativo, only: [:index, :candidatar, :new, :edit, :update, :destroy]

  # GET /vagas
  # GET /vagas.json
  def index
    if(!current_user.nil? && current_user.contratante?)
      @vagas = Vaga.where(contratante_id: current_user.id)
    else
      @vagas = {}
    end
  end
  
  def home
     @vagas_grid = initialize_grid(Vaga, :include => [:cidade, :faixa_salarial],
      order:'data_cadastro',
      order_direction: 'desc',
      per_page: 25)
  end

  # GET /vagas/1
  # GET /vagas/1.json
  def show
  end

  # GET /vagas/new
  def new
    @vaga = Vaga.new
    @contratante = @current_user.pessoa
    @faixas_salariais = FaixaSalarial.all
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
  end

  # GET /vagas/1/edit
  def edit
    @faixas_salariais = FaixaSalarial.all
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
  end
  
  # POST /vagas
  # POST /vagas.json
  def create
    @vaga = Vaga.new(vaga_params)

    respond_to do |format|
      if @vaga.save
        format.html { redirect_to @vaga, notice: 'Vaga was successfully created.' }
        format.json { render :show, status: :created, location: @vaga }
      else
        format.html { render :new }
        format.json { render json: @vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vagas/1
  # PATCH/PUT /vagas/1.json
  def update
    respond_to do |format|
      if @vaga.update(vaga_params)
        format.html { redirect_to @vaga, notice: 'Vaga was successfully updated.' }
        format.json { render :show, status: :ok, location: @vaga }
      else
        format.html { render :edit }
        format.json { render json: @vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vagas/1
  # DELETE /vagas/1.json
  def destroy
    @vaga.destroy
    respond_to do |format|
      format.html { redirect_to vagas_url, notice: 'Vaga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaga
      @vaga = Vaga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vaga_params
      params.require(:vaga).permit(:contratante_id, :faixa_salarial_id, :cidade_id, :quantidade, :cargo, :descricao, :data_cadastro, :data_inicio_inscricao, :data_termino_inscricao)
    end
end

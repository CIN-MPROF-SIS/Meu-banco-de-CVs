class CandidaturasController < ApplicationController
  before_action :set_vaga, only: [:candidatar, :show, :edit, :update]
  before_action :require_user, only: [:candidatar, :show ,:new, :edit, :update, :destroy]
  before_action :require_candidato, only: [:candidatar, :new, :edit, :update, :destroy]

  # GET /vagas
  # GET /vagas.json
  def index
    @pessoas_fisicas_vagas = PessoaFisicaVaga.where(pessoa_fisica_id: 1)
  end
  
  def home
    @vagas = Vaga.all
  end

  # GET /vagas/1
  # GET /vagas/1.json
  def candidatar
    @pessoa_fisica_vaga = PessoaFisicaVaga.new
    @pessoa_fisica_vaga.vaga = @vaga
    @id = "new_candidatura"
    @url = "/candidaturas"
    @classe = "new_candidatura"
    @metodo = nil
  end

  # GET /vagas/new
  def new
    @vaga = Vaga.new
    @contratante = @current_user
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
  
  # POST /candidaturas
  # POST /candidaturas.json
  def create
    @pessoa_fisica_vaga = PessoaFisicaVaga.new(pessoa_fisica_vaga_params)
    @pessoa_fisica_vaga.pessoa_fisica = PessoaFisica.find(1)
    #@pessoa_fisica_vaga.vaga = @vaga

    respond_to do |format|
      if @pessoa_fisica_vaga.save
        format.html { redirect_to candidaturas_path, notice: 'Candidatura was successfully created.' }
        format.json { render :show, status: :created, location: @pessoa_fisica_vaga }
      else
        format.html { render :new }
        format.json { render json: @pessoa_fisica_vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vagas/1
  # PATCH/PUT /vagas/1.json
  def update
    respond_to do |format|
      if @pessoa_fisica_vaga.update(pessoa_fisica_vaga_params)
        format.html { redirect_to "/candidaturas/" + @pessoa_fisica_vaga.id.to_s, notice: 'Candidatura was successfully updated.' }
        format.json { render :show, status: :ok, location: @pessoa_fisica_vaga }
      else
        format.html { render :edit }
        format.json { render json: @pessoa_fisica_vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vagas/1
  # DELETE /vagas/1.json
  def destroy
    @pessoa_fisica_vaga = PessoaFisicaVaga.find(params[:id])
    @pessoa_fisica_vaga.destroy
    respond_to do |format|
      format.html { redirect_to candidaturas_path, notice: 'Candidatura was successfully destroyed.' }
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
    
    def pessoa_fisica_vaga_params
      params.require(:pessoa_fisica_vaga).permit(:pessoa_fisica_id, :vaga_id)
    end
end

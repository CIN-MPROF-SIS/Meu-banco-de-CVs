class CandidatosController < ApplicationController
  before_action :set_pessoa_fisica, only: [:show, :edit, :update, :destroy]

  def getMunicipios
    val = params[:uf]
    #Use val to find records
    options = Municipio.where(unidade_federativa_id: val).collect{|x| '["' + x.id.to_s + '" , "' + x.nome + '"]'}    
    render :text => '{"aaData": [' + options.join(",") + ']}' 
  end

  # GET /candidatos
  # GET /candidatos.json
  def index
    @pessoas_fisicas = PessoaFisica.all
  end

  # GET /candidatos/1
  # GET /candidatos/1.json
  def show
  end

  # GET /candidatos/new
  def new
    @pessoa_fisica = PessoaFisica.new
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
    @id = "new_candidato"
    @url = candidatos_path
    @classe = "new_candidato"
    @niveis = Nivel.all
    @linguas = Lingua.all
    @metodo = nil
    @graus_formacao = GrauFormacao.all
  end

  # GET /candidatos/1/edit
  def edit
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
    @id = "edit_candidato_" + @pessoa_fisica.id.to_s
    @url = candidato_path(@pessoa_fisica)
    @classe = "edit_candidato"
    @niveis = Nivel.all
    @linguas = Lingua.all
    @metodo = :patch
    @graus_formacao = GrauFormacao.all
  end

  # POST /candidatos
  # POST /candidatos.json
  def create
    @pessoa_fisica = PessoaFisica.new(pessoa_fisica_params)

    respond_to do |format|
      if @pessoa_fisica.save
        format.html { redirect_to candidato_path(@pessoa_fisica), notice: 'Candidato was successfully created.' }
        format.json { render :show, status: :created, location: @pessoa_fisica }
      else
        format.html { render :new }
        format.json { render json: @pessoa_fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidatos/1
  # PATCH/PUT /candidatos/1.json
  def update
    respond_to do |format|
      if @pessoa_fisica.update(pessoa_fisica_params)
        format.html { redirect_to candidato_path(@pessoa_fisica), notice: 'Candidato was successfully updated.' }
        format.json { render :show, status: :ok, location: @pessoa_fisica }
      else
        format.html { render :edit }
        format.json { render json: @pessoa_fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidatos/1
  # DELETE /candidatos/1.json
  def destroy
    @pessoa_fisica.destroy
    respond_to do |format|
      format.html { redirect_to pessoas_fisicas_url, notice: 'Candidato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa_fisica
      @pessoa_fisica = PessoaFisica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_fisica_params
      params.require(:pessoa_fisica).permit(:nome, :email, :telefone, :logradouro, :complemento, :numero, :cep, :bairro, :municipio_id, :dataNascimento, :naturalidade_id, :nacionalidade, :cpf, :foto, certificados_attributes: [:id, :descricao, :_destroy], candidato_linguas_attributes: [:id, :lingua_id, :nivel_id, :_destroy], formacoes_academicas_attributes: [:id, :instituicao, :cargaHoraria, :dataInicio, :dataConclusao, :grau_formacao_id, :_destroy], experiencias_profissionais_attributes: [:id, :empresa, :areaAtuacao, :dataInicio, :dataConclusao, :_destroy])
    end
end

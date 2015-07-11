class CandidatosController < ApplicationController
  before_action :set_candidato, only: [:show, :edit, :update, :destroy]

  def getMunicipios
    val = params[:uf]
    #Use val to find records
    options = Municipio.where(unidade_federativa_id: val).collect{|x| '["' + x.id.to_s + '" , "' + x.nome + '"]'}    
    render :text => '{"aaData": [' + options.join(",") + ']}' 
  end

  # GET /candidatos
  # GET /candidatos.json
  def index
    @candidatos = Candidato.all
  end

  # GET /candidatos/1
  # GET /candidatos/1.json
  def show
  end

  # GET /candidatos/new
  def new
    @candidato = Candidato.new
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
    @id = "new_candidato"
    @url = candidatos_path
    @classe = "new_candidato"
    @niveis = Nivel.all
    @linguas = Lingua.all
    @metodo = nil
  end

  # GET /candidatos/1/edit
  def edit
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
    @id = "edit_candidato_" + @candidato.id.to_s
    @url = candidato_path(@candidato)
    @classe = "edit_candidato"
    @niveis = Nivel.all
    @linguas = Lingua.all
    @metodo = :patch
  end

  # POST /candidatos
  # POST /candidatos.json
  def create
    @candidato = Candidato.new(candidato_params)

    respond_to do |format|
      if @candidato.save
        format.html { redirect_to candidato_path(@candidato), notice: 'Candidato was successfully created.' }
        format.json { render :show, status: :created, location: @candidato }
      else
        format.html { render :new }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidatos/1
  # PATCH/PUT /candidatos/1.json
  def update
    respond_to do |format|
      if @candidato.update(candidato_params)
        format.html { redirect_to candidato_path(@candidato), notice: 'Candidato was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidato }
      else
        format.html { render :edit }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidatos/1
  # DELETE /candidatos/1.json
  def destroy
    @candidato.destroy
    respond_to do |format|
      format.html { redirect_to candidatos_url, notice: 'Candidato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidato
      @candidato = Candidato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidato_params
      params.require(:candidato).permit(:nome, :email, :telefone, :logradouro, :complemento, :numero, :cep, :bairro, :municipio_id, :dataNascimento, :naturalidade_id, :nacionalidade, :cpf, :foto, certificados_attributes: [:id, :descricao, :_destroy], candidato_linguas_attributes: [:id, :lingua_id, :nivel_id, :_destroy])
    end
end

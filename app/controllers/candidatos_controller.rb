class CandidatosController < ApplicationController
  before_action :set_candidato, only: [:show, :edit, :update, :destroy]
  before_action :set_variaveis, only: [:new, :show, :edit, :update, :destroy, :create]
  #berofe_action :set_variaveis, only: [:new, :show, :edit, :update, :destroy, :create]
  before_action :require_user, only: [:index, :create, :update, :show ,:new, :edit, :update, :destroy]
  before_action :require_moderador, only: [:index, :destroy]

  def getMunicipios
    val = params[:uf]
    #Use val to find records
    options = Municipio.where(unidade_federativa_id: val).order(nome: :asc).collect{|x| '["' + x.id.to_s + '" , "' + x.nome + '"]'}    
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
    @id = "new_candidato"
    @url = candidatos_path
    @classe = "new_candidato"
    @metodo = nil
  end

  # GET /candidatos/1/edit
  def edit
    @id = "edit_candidato_" + @candidato.id.to_s
    @url = candidato_path(@candidato)
    @classe = "edit_candidato"
    @metodo = :patch
  end

  # POST /candidatos
  # POST /candidatos.json
  def create
    @candidato = Candidato.new(candidato_params)
    @usuario = current_user
    @usuario.pessoa = @candidato
    @usuario.status = true
    
    respond_to do |format|
      extensoes_foto = ['jpg', 'jpeg', 'gif', 'png']
      if @candidato.foto_url != nil and !extensoes_foto.include? @candidato.foto_url.split('.')[1].downcase
        format.html { redirect_to edit_candidato_path(@candidato),  :flash => { :alert => "Formato da foto não é de imagem." }  }
      else
        @candidato.telefone.gsub!(/[^a-zA-Z]/, '')
        if @candidato.save! && @usuario.save!
          format.html { redirect_to edit_candidato_path(@candidato), notice: 'Candidato criado com sucesso.' }
          format.json { render :show, status: :created, location: @candidato }
        else
          format.html { render :new, alert:  @candidato.errors}
          format.json { render json: @candidato.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /candidatos/1
  # PATCH/PUT /candidatos/1.json
  def update
    respond_to do |format|
      extensoes_foto = ['jpg', 'jpeg', 'gif', 'png']
      if @candidato.foto_url != nil and !extensoes_foto.include? @candidato.foto_url.split('.')[1].downcase
        format.html { redirect_to edit_candidato_path(@candidato),  :flash => { :alert => "Formato da foto não é de imagem." }  }
      else
        @candidato.telefone = @candidato.telefone.gsub(/[^0-9a-z]/i, '')
        if @candidato.update(candidato_params)
          format.html { redirect_to candidato_path(@candidato), notice: 'Candidato alterado com sucesso.' }
          format.json { render :show, status: :ok, location: @candidato }
        else
          format.html { render :edit }
          format.json { render json: @candidato.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /candidatos/1
  # DELETE /candidatos/1.json
  def destroy
    @candidato.destroy
    respond_to do |format|
      format.html { redirect_to candidatos_url, notice: 'Candidato deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidato
      @candidato = Candidato.find(params[:id])
    end
    
    def set_variaveis
      @unidades_federativas = UnidadeFederativa.all
      @municipios = Municipio.where(unidade_federativa_id: 0)
      @niveis = Nivel.all
      @linguas = Lingua.all
      @graus_formacao = GrauFormacao.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
     def candidato_params
      params.require(:candidato).permit(:nome, :email, :telefone, :logradouro, :complemento, :numero, :cep, :bairro, :municipio_id, :dataNascimento, :naturalidade_id, :nacionalidade, :cpf, :foto, :curriculo , certificados_attributes: [:id, :descricao, :_destroy], candidato_linguas_attributes: [:id, :lingua_id, :nivel_id, :_destroy], formacoes_academicas_attributes: [:id, :instituicao, :cargaHoraria, :dataInicio, :dataConclusao, :grau_formacao_id, :_destroy], experiencias_profissionais_attributes: [:id, :empresa, :areaAtuacao, :dataInicio, :dataConclusao, :_destroy])
     end
end

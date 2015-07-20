class CandidaturasController < ApplicationController
  before_action :set_vaga, only: [:candidatar, :show, :edit, :update]
  before_action :require_user, only: [:index,:candidatar, :show ,:new, :edit, :update, :destroy]
  before_action :require_candidato, only: [:index, :candidatar, :new, :edit, :update, :destroy]
  before_action :require_ativo, only: [:home,:index, :candidatar, :new, :edit, :update, :destroy]

  # GET /vagas
  # GET /vagas.json
  def index
    if(!current_user.nil? && current_user.candidato?)
      @candidatos_vagas = CandidatoVaga.where(candidato_id: current_user.pessoa.id)
    else
      @candidatos_vagas = {}
    end
  
    
  end
  
  def home
    #@vagas = Vaga.where(Date.today => :data_inicio_inscricao..:data_termino_inscricao)
    @vagas = Vaga.where("? BETWEEN data_inicio_inscricao AND data_termino_inscricao",  Date.today)
    @vagas_grid = initialize_grid(Vaga.where("? BETWEEN data_inicio_inscricao AND data_termino_inscricao",  Date.today), :include => [:cidade, :faixa_salarial], per_page: 6)
    @faixas_salariais = FaixaSalarial.all
    @candidaturas = Hash[CandidatoVaga.where(candidato_id: @current_user.pessoa.id).map{ |cv| [cv.vaga.id, true] }]
    
  end

  def candidatar
    @candidato_vaga = CandidatoVaga.new
    @candidato_vaga.vaga = @vaga
    @id = "new_candidatura"
    @url = "/candidaturas"
    @classe = "new_candidatura"
    @metodo = nil
    @jaCandidatou = CandidatoVaga.where(candidato_id: @current_user.pessoa.id, vaga_id: @vaga.id).length > 0
  end
  
  def new
    @vaga = Vaga.new
    @contratante = @current_user
    @faixas_salariais = FaixaSalarial.all
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
  end

  def edit
    @faixas_salariais = FaixaSalarial.all
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
  end
  
  # POST /candidaturas
  # POST /candidaturas.json
  def create
    @candidato_vaga = CandidatoVaga.new(candidato_vaga_params)
    if(!current_user.nil? && current_user.candidato?)
      @candidato_vaga.candidato = current_user.pessoa
    end
    #@candidato_vaga.vaga = @vaga

    respond_to do |format|
      if @candidato_vaga.save
        format.html { redirect_to candidaturas_path, notice: 'Candidatura registrada com sucesso.' }
        format.json { render :show, status: :created, location: @candidato_vaga }
      else
        format.html { render :new }
        format.json { render json: @candidato_vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidato_vaga.update(candidato_vaga_params)
        format.html { redirect_to "/candidaturas/" + @candidato_vaga.id.to_s, notice: 'Candidatura atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @candidato_vaga }
      else
        format.html { render :edit }
        format.json { render json: @candidato_vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @candidato_vaga = CandidatoVaga.find(params[:id])
    @candidato_vaga.destroy
    respond_to do |format|
      format.html { redirect_to candidaturas_path, notice: 'Candidatura excluída com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  def avaliarCandidatoVaga
    @candidatos_vagas = CandidatoVaga.where(vaga_id: params[:vaga_id])
    puts(@candidatos_vagas)
  end
  
  def mostrarNotasQuestionario
    @questionario = Questionario.find(params[:id])
    @candidaturas = []
    @notas = Hash[]
    @notasBanco = Resposta.joins(opcao: :questao).where(questoes: {questionario_id: params[:id]})
    
    @notasBanco.select('DISTINCT "respostas"."candidato_id"').each do |candidato|
      @candidato = CandidatoVaga.find_by(candidato_id: candidato.candidato_id)
      @notasBanco.each do |resposta|
        @candidato.nota||= 0
        #@notas[candidato.candidato_id] ||= 0
        if resposta.opcao.gabarito
          #@notas[candidato.candidato_id] += resposta.opcao.questao.nota
          @candidato.nota += resposta.opcao.questao.nota
        end
        
      end
      @candidaturas << @candidato
    end
    @candidaturas.sort_by{|c| c.nota}.reverse!
    puts(@candidaturas)
  end
  
   def selecionar
     @candidato_vaga = CandidatoVaga.find(params[:id])
      respond_to do |format|
      if @candidato_vaga.update(:selecionado => true)
           format.html { redirect_to "/avaliarCandidatoVaga/" + @candidato_vaga.vaga.id.to_s}
      end
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
    
    def candidato_vaga_params
      params.require(:candidato_vaga).permit(:candidato_id, :vaga_id)
    end
end

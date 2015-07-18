class QuestionariosController < ApplicationController
  before_action :set_questionario, only: [:show, :edit, :update, :destroy, :responder]
  before_action :set_vaga, only: [:index, :new]
  before_action :require_user, only: [:index, :show, :edit, :update, :destroy, :responder]
  before_action :require_candidato, only: [:responder, :salvarrespostas]
  
  def index
    @questionarios = Questionario.where(vaga_id: @vaga.id)
    if current_user.candidato?
      @questionarios_respondidos = Hash[Resposta.joins(opcao: [{ questao: :questionario }]).where(candidato_id: @current_user.pessoa.id, questionarios: {vaga_id: @vaga.id}).map{ |r| [r.opcao.questao.questionario.id, 1] }]
    end
  end
  
  def show
    #@questionario = Questionario.find(params[:id])
  end
  
  def responder
    #@opcoesExistentes = Resposta.joins(opcao: [{ questao: :questionario }]).where(candidato_id: @current_user.pessoa.id, questionarios: {vaga_id: @vaga.id}).map{ |r| [r.opcao.id, 1] }
    @opcoesExistentes = Hash[Resposta.joins(opcao: [{ questao: :questionario }]).where(candidato_id: @current_user.pessoa.id, questoes: {questionario_id: @questionario.id}).map{ |r| [r.opcao.id, 1] }]
  end
  
  def salvarrespostas
    Resposta.joins(opcao: [{ questao: :questionario }]).where(candidato_id: @current_user.pessoa.id, questoes: {questionario_id: params[:questionario]}).delete_all
    params[:resposta].each do |i, value|
      o = Opcao.find(value)
      r = Resposta.new
      
      r.opcao = o
      r.candidato = @current_user.pessoa
      r.save
    end
    respond_to do |format|
      format.html { redirect_to "/questionarios/vaga/" + params[:vaga], notice: 'Questionário respondido.' }
      format.json { render :show, status: :ok, location: r }
    end
  end
  
  def new
    @questionario = Questionario.new
    @questionario.vaga = @vaga
#    3.times do
#      questao = @questionario.questoes.build
#      4.times { questao.opcoes.build }
#    end
  end
  
  def create
    @questionario = Questionario.new(questionario_params)

    respond_to do |format|
      if @questionario.save
        format.html { redirect_to @questionario, notice: 'Questionário criado com sucesso' }
        format.json { render :show, status: :created, location: @questionario }
      else
        format.html { render :new }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    #@questionario = Questionario.find(params[:id])
  end
  
  def update
    respond_to do |format|
      if @questionario.update(questionario_params)
        format.html { redirect_to @questionario, notice: 'Questionário atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @questionario }
      else
        format.html { render :edit }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @questionario.destroy
    respond_to do |format|
      format.html { redirect_to questionarios_url, notice: 'Questionario excluído com sucesso.' }
      format.json { head :no_content }
    end

  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionario
      @questionario = Questionario.find(params[:id])
    end
    
    def set_vaga
      @vaga = Vaga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionario_params
      params.require(:questionario).permit(:descricao, :vaga_id, questoes_attributes: [:id, :questionario_id, :descricao, :nota, :_destroy, opcoes_attributes: [:id, :questao_id, :gabarito, :descricao, :_destroy]])
    end
end

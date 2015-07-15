class QuestionariosController < ApplicationController
  before_action :set_questionario, only: [:show, :edit, :update, :destroy]
  before_action :set_vaga, only: [:index, :new]
  
  def index
    @questionarios = Questionario.where(vaga_id: @vaga.id)
  end
  
  def show
    #@questionario = Questionario.find(params[:id])
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
        format.html { redirect_to @questionario, notice: 'Questionario was successfully created.' }
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
        format.html { redirect_to @questionario, notice: 'Questionario was successfully updated.' }
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
      format.html { redirect_to questionarios_url, notice: 'Questionario was successfully destroyed.' }
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
      params.require(:questionario).permit(:descricao, :vaga_id, questoes_attributes: [:id, :questionario_id, :descricao, :_destroy, opcoes_attributes: [:id, :questao_id, :descricao, :_destroy]])
    end
end

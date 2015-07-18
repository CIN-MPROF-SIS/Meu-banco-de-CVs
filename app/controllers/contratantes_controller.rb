class ContratantesController < ApplicationController
  before_action :set_contratante, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :create, :update, :show ,:new, :edit, :update, :destroy]
  before_action :require_moderador, only: [:index, :destroy]

  # GET /contratantes
  # GET /contratantes.json
  def index
    @contratantes = Contratante.all
  end

  # GET /contratantes/1
  # GET /contratantes/1.json
  def show
  end
  
  def resumo
    @contratante = Contratante.find(params[:id])
  end

  # GET /contratantes/new
  def new
    @contratante = Contratante.new
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
  end

  # GET /contratantes/1/edit
  def edit
    @unidades_federativas = UnidadeFederativa.all
    @municipios = Municipio.where(unidade_federativa_id: 0)
  end

  # POST /contratantes
  # POST /contratantes.json
  def create
    @contratante = Contratante.new(contratante_params)
    @usuario =  current_user
    @usuario.pessoa = @contratante
    #@usuario.status = true

    respond_to do |format|
      extensoes_foto = ['jpg', 'jpeg', 'gif', 'png']
      if @contratante.logo_url != nil and !extensoes_foto.include? @contratante.foto_url.split('.')[1].downcase
        format.html { redirect_to new_contratante_path(@contratante),  :flash => { :alert => "Formato da foto não é de imagem." }  }
      else
        if @contratante.save! && @usuario.save!
          format.html { redirect_to edit_contratante_path(@contratante), notice: 'Contratante criado com sucesso.' }
          format.json { render :show, status: :created, location: @contratante }
        else
          format.html { render :new }
          format.json { render json: @contratante.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /contratantes/1
  # PATCH/PUT /contratantes/1.json
  def update
    respond_to do |format|
      extensoes_foto = ['jpg', 'jpeg', 'gif', 'png']
      if @contratante.logo_url != nil and !extensoes_foto.include? @contratante.foto_url.split('.')[1].downcase
        format.html { redirect_to edit_contratante_path(@contratante),  :flash => { :alert => "Formato da foto não é de imagem." }  }
      else
        if @contratante.update(contratante_params)
          format.html { redirect_to contratante_path(@contratante), notice: 'Contratante alterado com sucesso.' }
          format.json { render :show, status: :ok, location: @contratante }
        else
          format.html { render :edit }
          format.json { render json: @contratante.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /contratantes/1
  # DELETE /contratantes/1.json
  def destroy
    @contratante.destroy
    respond_to do |format|
      format.html { redirect_to contratantes_url, notice: 'Contratante deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contratante
      @contratante = Contratante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contratante_params
      params.require(:contratante).permit(:nome, :email, :telefone, :logradouro, :complemento, :numero, :bairro, :cep, :municipio_id, :inscricaoEstadual, :cnpj, :logo)
    end
end

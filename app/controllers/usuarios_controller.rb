class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :update, :show , :edit, :update, :destroy]
  before_action :require_moderador, only: [:index, :autorizarContratante, :destroy]


  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end
  
  def autorizarContratante
    @usuarios = Usuario.where(papel: 'contratante', status: false)
  end
  
  def aprovarContratante
    @usuario = Usuario.find(params[:id])
      respond_to do |format|
        if @usuario.update(:status => true)
              format.html { redirect_to autorizarContratantes_path }
        end
      end
  end
  
  def reprovarContratante
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to autorizarContratantes_path, notice: 'Contratante reprovado com sucesso.' }
      format.json { head :no_content }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end
  
  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
     respond_to do |format|
      if @usuario.save
        format.html { redirect_to root_url, notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuário altarado com sucesso.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuário apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:login, :password, :papel)
    end
end

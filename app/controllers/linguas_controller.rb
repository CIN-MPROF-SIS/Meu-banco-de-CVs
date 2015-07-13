class LinguasController < ApplicationController
  before_action :set_lingua, only: [:show, :edit, :update, :destroy]

  # GET /linguas
  # GET /linguas.json
  def index
    @linguas = Lingua.all
  end

  # GET /linguas/1
  # GET /linguas/1.json
  def show
  end

  # GET /linguas/new
  def new
    @lingua = Lingua.new
  end

  # GET /linguas/1/edit
  def edit
  end

  # POST /linguas
  # POST /linguas.json
  def create
    @lingua = Lingua.new(lingua_params)

    respond_to do |format|
      if @lingua.save
        format.html { redirect_to @lingua, notice: 'Lingua was successfully created.' }
        format.json { render :show, status: :created, location: @lingua }
      else
        format.html { render :new }
        format.json { render json: @lingua.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linguas/1
  # PATCH/PUT /linguas/1.json
  def update
    respond_to do |format|
      if @lingua.update(lingua_params)
        format.html { redirect_to @lingua, notice: 'Lingua was successfully updated.' }
        format.json { render :show, status: :ok, location: @lingua }
      else
        format.html { render :edit }
        format.json { render json: @lingua.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linguas/1
  # DELETE /linguas/1.json
  def destroy
    @lingua.destroy
    respond_to do |format|
      format.html { redirect_to linguas_url, notice: 'Lingua was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lingua
      @lingua = Lingua.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lingua_params
      params.require(:lingua).permit(:descricao)
    end
end

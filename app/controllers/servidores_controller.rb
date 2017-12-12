class ServidoresController < ApplicationController
  before_action :set_servidor, only: [:show, :edit, :update, :destroy]

  # GET /servidores
  # GET /servidores.json
  def index
    @servidores = Servidor.all
  end

  # GET /servidores/1
  # GET /servidores/1.json
  def show
  end

  # GET /servidores/new
  def new
    @servidor = Servidor.new
  end

  # GET /servidores/1/edit
  def edit
  end

  # POST /servidores
  # POST /servidores.json
  def create
    @servidor = Servidor.new(servidor_params)

    respond_to do |format|
      if @servidor.save
        format.html { redirect_to servidores_path, success: 'Servidor cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @servidor }
      else
        format.html { render :new }
        format.json { render json: @servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servidores/1
  # PATCH/PUT /servidores/1.json
  def update
    respond_to do |format|
      if @servidor.update(servidor_params)
        format.html { redirect_to servidores_path, success: 'Servidor atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @servidor }
      else
        format.html { render :edit }
        format.json { render json: @servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servidores/1
  # DELETE /servidores/1.json
  def destroy
    @servidor.destroy
    respond_to do |format|
      format.html { redirect_to servidores_path, notice: 'Servidor excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servidor
      @servidor = Servidor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servidor_params
      params.require(:servidor).permit(:nome, :email, :telefone,
        credenciais_attributes: [:id, :codigo, :type])
      end
end

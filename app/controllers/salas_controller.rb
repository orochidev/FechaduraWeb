class SalasController < ApplicationController
  before_action :set_sala, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index]

  # GET /salas
  # GET /salas.json
  def index
    @salas = Sala.all
  end

  # GET /salas/1
  # GET /salas/1.json
  def show
  end

  # GET /salas/new
  def new
    @sala = Sala.new
  end

  # GET /salas/1/edit
  def edit

  end

  # POST /salas
  # POST /salas.json
  def create
    @sala = Sala.new(sala_params)
    respond_to do |format|
      if @sala.save
        format.html { redirect_to salas_path, success: "A sala #{@sala.to_s} foi criada com sucesso!" }
        format.json { render :show, status: :created, location: @sala }
      else
        flash.now[:error] = @sala.errors
        format.html { render :new }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salas/1
  # PATCH/PUT /salas/1.json
  def update
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to salas_path, success: "Sala #{@sala.to_s} atualizada com sucesso!." }
        format.json { render :show, status: :ok, location: @sala }
      else
        format.html {
           flash.now[:error] = @sala.errors
           render :edit
         }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas/1
  # DELETE /salas/1.json
  def destroy
    @sala.destroy
    respond_to do |format|
      format.html { redirect_to salas_url, notice: 'Sala was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      @sala = Sala.find(params[:id])
      @horarios = @sala.horarios
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_params
      params.require(:sala).permit!
    end
end

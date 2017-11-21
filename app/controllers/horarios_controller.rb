class HorariosController < ApplicationController
  before_action :set_horario, only: [:show, :edit, :update, :destroy]
  before_action :set_sala

  before_action :authorize

  # GET /turnos
  # GET /turnos.json
  def index
    @horarios = @sala.horarios
  end

  # GET /turnos/1
  # GET /turnos/1.json
  def show
  end

  # GET /turnos/new
  def new
    @horario = Horario.new
  end

  # GET /turnos/1/edit
  def edit
  end

  # POST /turnos
  # POST /turnos.json
  def create
    @horario = Horario.new(horario_params)
    @horario.sala = @sala
    @horario.horario_itens.each{|h| h.horario = @horario }
      if @horario.save
        redirect_to edit_sala_path(@sala), :success => "Horario criado com sucesso!"
      else
        flash.now[:error] = @horario.errors
        render :new
      end
  end

  # PATCH/PUT /turnos/1
  # PATCH/PUT /turnos/1.json
  def update
      if @horario.update(horario_params)
        redirect_to edit_sala_path(@sala), success: "Horário atualizado com sucesso!"
      else
        flash.now[:error] = @horario.errors
        render :edit
      end
  end

  # DELETE /turnos/1
  # DELETE /turnos/1.json
  def destroy
    @horario.destroy
    redirect_to edit_sala_path(@sala), success: 'Horário excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end
    def set_sala
      @sala = Sala.find(params[:sala_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_params
      params.require(:horario).permit(:tipo_permitido,
        horario_itens_attributes: [:id, :horario_inicio, :horario_fim, :dia, :ativo])
    end
end

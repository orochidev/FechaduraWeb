class RfidsController < ApplicationController
  before_action :set_rfid, only: [:show, :edit, :update, :destroy]
  before_action :set_pessoa

  # GET /rfids
  # GET /rfids.json
  def index
    respond_to do |format|
      format.html{
        redirect_to @pessoa
      }
      format.json{
        @rfids = RFID.all
        if params[:search]
          @rfids = RFID.search(params[:search])
        else
          @rfids = RFID.all
        end
      }
    end
   end

  # GET /rfids/1
  # GET /rfids/1.json
  def show
  end

  # GET /rfids/new
  def new
    @rfid = RFID.new
  end

  # GET /rfids/1/edit
  def edit
  end

  # POST /rfids
  # POST /rfids.json
  def create
    @rfid = RFID.new(rfid_params)
    @rfid.pessoa = @pessoa
    respond_to do |format|
      if @rfid.save
        format.html { redirect_to @pessoa, success: 'RFID cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @rfid }
      else
        format.html {
          flash.now[:error] = @rfid.errors
          render :new
        }
        format.json { render json: @rfid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rfids/1
  # PATCH/PUT /rfids/1.json
  def update
    respond_to do |format|
      if @rfid.update(rfid_params)
        format.html { redirect_to @pessoa, success: 'RFID atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @rfid }
      else
        format.html {
          flash.now[:error] = @rfid.errors
          render :edit
        }
        format.json { render json: @rfid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rfids/1
  # DELETE /rfids/1.json
  def destroy
    @rfid.destroy
    respond_to do |format|
      format.html { redirect_to @rfid.pessoa, success: 'RFID excluída com sucesso!.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfid
      @rfid = RFID.find(params[:id])
    end
    def set_pessoa
      @pessoa = Pessoa.find(params[:pessoa_id]) if params[:pessoa_id]
      @pessoa = Pessoa.find(params[:aluno_id]) if params[:aluno_id]

    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def rfid_params
      params.require(:rfid).permit!
    end
end

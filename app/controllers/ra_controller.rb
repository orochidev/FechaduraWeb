class RaController < ApplicationController
  before_action :set_ra, only: [:show, :edit, :update, :destroy]

  # GET /ras
  # GET /ras.json
  def index
    @ras = Ra.all
  end

  # GET /ras/1
  # GET /ras/1.json
  def show
  end

  # GET /ras/new
  def new
    @ra = Ra.new
  end

  # GET /ras/1/edit
  def edit
  end

  # POST /ras
  # POST /ras.json
  def create
    @ra = Ra.new(ra_params)

    respond_to do |format|
      if @ra.save
        format.html { redirect_to @ra, notice: 'Ra was successfully created.' }
        format.json { render :show, status: :created, location: @ra }
      else
        format.html { render :new }
        format.json { render json: @ra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ras/1
  # PATCH/PUT /ras/1.json
  def update
    respond_to do |format|
      if @ra.update(ra_params)
        format.html { redirect_to @ra, notice: 'Ra was successfully updated.' }
        format.json { render :show, status: :ok, location: @ra }
      else
        format.html { render :edit }
        format.json { render json: @ra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ras/1
  # DELETE /ras/1.json
  def destroy
    @ra.destroy
    respond_to do |format|
      format.html { redirect_to ras_url, notice: 'Ra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ra
      @ra = Ra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ra_params
      params.fetch(:ra, {})
    end
end

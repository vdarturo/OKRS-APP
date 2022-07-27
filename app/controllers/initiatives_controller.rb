class InitiativesController < ApplicationController
  before_action :set_initiative, only: %i[ show edit update destroy ]

  # GET /initiatives or /initiatives.json
  def index
    @initiatives = Initiative.all
  end

  # GET /initiatives/1 or /initiatives/1.json
  def show
  end

  # GET /initiatives/new
  def new
    @initiative = Initiative.new
  end

  # GET /initiatives/1/edit
  def edit
  end

  # POST /initiatives or /initiatives.json
  def create
    @initiative = Initiative.new(initiative_params)

    respond_to do |format|
      if @initiative.save
        format.html { redirect_to initiative_url(@initiative), notice: "Initiative was successfully created." }
        format.json { render :show, status: :created, location: @initiative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /initiatives/1 or /initiatives/1.json
  def update
    respond_to do |format|
      if @initiative.update(initiative_params)
        format.html { redirect_to initiative_url(@initiative), notice: "Initiative was successfully updated." }
        format.json { render :show, status: :ok, location: @initiative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initiatives/1 or /initiatives/1.json
  def destroy
    @initiative.destroy

    respond_to do |format|
      format.html { redirect_to initiatives_url, notice: "Initiative was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_initiative
      @initiative = Initiative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def initiative_params
      params.require(:initiative).permit(:name, :description, :start_date, :end_date, :type_metric, :strat_value, :target, :current_value, :progress, :key_result_id, :owner_id)
    end
end

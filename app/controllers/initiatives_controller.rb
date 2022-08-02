class InitiativesController < ApplicationController
  before_action :set_initiative, only: %i[ show edit update destroy ]

  # GET /initiatives or /initiatives.json
  def index
    @initiatives = Initiative.all
  end

  # GET /initiatives/1 or /initiatives/1.json
  def show
    ini = Initiative.find(params[:id])
    @key_result = KeyResult.find(ini.key_result_id)
    @owner = Owner.find(ini.owner_id)
  end

  # GET /initiatives/new
  def new
    @initiative = Initiative.new
    owners = Owner.all
    @owners = owners.map{|owner| [owner.name, owner.id]}
    key_results = KeyResult.all
    @key_results = key_results.map{|key_result| [key_result.name, key_result.id]}
  end

  # GET /initiatives/1/edit
  def edit
    owners = Owner.all
    @owners = owners.map{|owner| [owner.name, owner.id]}
    key_results = KeyResult.all
    @key_results = key_results.map{|key_result| [key_result.name, key_result.id]}
  end

  # POST /initiatives or /initiatives.json
  def create
    owners = Owner.all
    @owners = owners.map{|owner| [owner.name, owner.id]}
    key_results = KeyResult.all
    @key_results = key_results.map{|key_result| [key_result.name, key_result.id]}
  
    @initiative = Initiative.create(
      name: params[:initiative][:name],
      description: params[:initiative][:description],
      start_date: params[:initiative][:start_date],
      end_date: params[:initiative][:end_date],
      type_metric: params[:initiative][:type_metric],
      start_value: params[:initiative][:start_value],
      target: params[:initiative][:target],
      current_value: params[:initiative][:current_value],
      progress: params[:initiative][:progress],
      key_result_id: params[:key_result_id],
      owner_id: params[:owner_id]
    )

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
      params.require(:initiative).permit(:name, :description, :start_date, :end_date, :type_metric, :start_value, :target, :current_value, :progress, :key_result_id, :owner_id)
    end
end

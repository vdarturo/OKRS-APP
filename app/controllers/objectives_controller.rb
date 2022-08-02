class ObjectivesController < ApplicationController
  before_action :set_objective, only: %i[ show edit update destroy ]

  # GET /objectives or /objectives.json
  def index
    @objectives = Objective.all
  end

  # GET /objectives/1 or /objectives/1.json
  def show
    obj = Objective.find(params[:id])
    @owner = Owner.find(obj.owner_id)
  end

  # GET /objectives/new
  def new
    @objective = Objective.new
    owners = Owner.all
    @options = owners.map{|owner| [owner.name, owner.id]}
  end

  # GET /objectives/1/edit
  def edit
    owners = Owner.all
    @options = owners.map{|owner| [owner.name, owner.id]}
  end

  # POST /objectives or /objectives.json
  def create
    owners = Owner.all
    @options = owners.map{|owner| [owner.name, owner.id]}
    owner = Owner.find(params[:owner_id])
    @objective = Objective.create(
      name: params[:objective][:name],
      description: params[:objective][:description],
      average_progress: params[:objective][:average_progress],
      owner_id: owner.id,
      organization_id: owner.organization_id
    )

    respond_to do |format|
      if @objective.save
        format.html { redirect_to objective_url(@objective), notice: "Objective was successfully created." }
        format.json { render :show, status: :created, location: @objective }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectives/1 or /objectives/1.json
  def update
    owners = Owner.all
    @options = owners.map{|owner| [owner.name, owner.id]}

    respond_to do |format|
      if @objective.update(objective_params)
        format.html { redirect_to objective_url(@objective), notice: "Objective was successfully updated." }
        format.json { render :show, status: :ok, location: @objective }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1 or /objectives/1.json
  def destroy
    @objective.destroy

    respond_to do |format|
      format.html { redirect_to objectives_url, notice: "Objective was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objective
      @objective = Objective.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def objective_params
      params.require(:objective).permit(:name, :description, :average_progress, :organization_id, :owner_id)
    end
end

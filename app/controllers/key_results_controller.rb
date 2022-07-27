class KeyResultsController < ApplicationController
  before_action :set_key_result, only: %i[ show edit update destroy ]

  # GET /key_results or /key_results.json
  def index
    @key_results = KeyResult.all
  end

  # GET /key_results/1 or /key_results/1.json
  def show
  end

  # GET /key_results/new
  def new
    @key_result = KeyResult.new
  end

  # GET /key_results/1/edit
  def edit
  end

  # POST /key_results or /key_results.json
  def create
    @key_result = KeyResult.new(key_result_params)

    respond_to do |format|
      if @key_result.save
        format.html { redirect_to key_result_url(@key_result), notice: "Key result was successfully created." }
        format.json { render :show, status: :created, location: @key_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @key_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_results/1 or /key_results/1.json
  def update
    respond_to do |format|
      if @key_result.update(key_result_params)
        format.html { redirect_to key_result_url(@key_result), notice: "Key result was successfully updated." }
        format.json { render :show, status: :ok, location: @key_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @key_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_results/1 or /key_results/1.json
  def destroy
    @key_result.destroy

    respond_to do |format|
      format.html { redirect_to key_results_url, notice: "Key result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_result
      @key_result = KeyResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def key_result_params
      params.require(:key_result).permit(:name, :description, :period, :type_metric, :strat_value, :target, :current_value, :progress, :objective_id, :owner_id)
    end
end

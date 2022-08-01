class OwnersController < ApplicationController
  before_action :set_owner, only: %i[ show edit update destroy ]

  # GET /owners or /owners.json
  def index
    @owners = Owner.all
  end

  # GET /owners/1 or /owners/1.json
  def show
    @user= User.find(params[:id])
  end

  # GET /owners/new
  def new
    @owner = Owner.new
    users = User.all
    @options = users.map{|user| [user.email, user.id]}
  end

  # GET /owners/1/edit
  def edit
    users = User.all
    @options = users.map{|user| [user.email, user.id]}
  end

  # POST /owners or /owners.json
  def create
    @owner = Owner.create(user_id: params[:user_id], organization_id: params[:organization_id], name: params[:owner][:name])
    users = User.all
    @options = users.map{|user| [user.email, user.id]}

    respond_to do |format|
      if @owner.save
        format.html { redirect_to owner_url(@owner), notice: "Owner was successfully created." }
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1 or /owners/1.json
  def update
    users = User.all
    @options = users.map{|user| [user.email, user.id]}
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to owner_url(@owner), notice: "Owner was successfully updated." }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1 or /owners/1.json
  def destroy
    @owner.destroy

    respond_to do |format|
      format.html { redirect_to owners_url, notice: "Owner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def owner_params
      params.require(:owner).permit(:name, :organization_id, :user_id)
    end
end

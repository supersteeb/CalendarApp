class DefaultitemsController < ApplicationController
  before_action :set_defaultitem, only: [:show, :edit, :update, :destroy, :toggle]

  # GET /defaultitems
  # GET /defaultitems.json
  def index
    @defaultitems = Defaultitem.all
  end

  # GET /defaultitems/1
  # GET /defaultitems/1.json
  def show
  end

  # GET /defaultitems/new
  def new
    @defaultitem = Defaultitem.new
  end

  # GET /defaultitems/1/edit
  def edit
  end

  # POST /defaultitems
  # POST /defaultitems.json
  def create
    @defaultitem = Defaultitem.create defaultitem_params
    redirect_to admins_path
  end

  def toggle
    @defaultitem.state = @defaultitem.active? ? 'inactive' : 'active'
    @defaultitem.save
    redirect_back(fallback_location: admins_path)
  end

  # PATCH/PUT /defaultitems/1
  # PATCH/PUT /defaultitems/1.json
  def update
    respond_to do |format|
      if @defaultitem.update(defaultitem_params)
        format.html { redirect_to @defaultitem, notice: 'Defaultitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @defaultitem }
      else
        format.html { render :edit }
        format.json { render json: @defaultitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defaultitems/1
  # DELETE /defaultitems/1.json
  def destroy
    @defaultitem.destroy
    respond_to do |format|
      format.html { redirect_to defaultitems_url, notice: 'Defaultitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_defaultitem
      @defaultitem = Defaultitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def defaultitem_params
      params.require(:defaultitem).permit(:name, :desc)
    end
end

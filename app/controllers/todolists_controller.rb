class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy, :detail]
  before_action :set_default_todolist, only: [:index, :create_todoitem]
  before_action :set_number_of_calendar, :get_completed_lists, only: [:index]

  # GET /todolists
  # GET /todolists.json
  def index
    @todoitems = @todolist.todoitems.order(:created_at)
  end

  def detail
  end

  # GET /todolists/1
  # GET /todolists/1.json
  def show
  end

  # GET /todolists/new
  def new
    @todolist = Todolist.new
  end

  # GET /todolists/1/edit
  def edit
  end

  # POST /todolists
  # POST /todolists.json
  def create
    @todolist = Todolist.new(todolist_params)

    respond_to do |format|
      if @todolist.save
        format.html { redirect_to @todolist, notice: 'Todolist was successfully created.' }
        format.json { render :show, status: :created, location: @todolist }
      else
        format.html { render :new }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_todoitem
    item = @todolist.todoitems.create params_todoitem
    if item.persisted?
      redirect_back(fallback_location: root_path)
    else
      raise "Errors: #{item.errors}"
    end
  end


  # PATCH/PUT /todolists/1
  # PATCH/PUT /todolists/1.json
  def update
    respond_to do |format|
      if @todolist.update(todolist_params)
        format.html { redirect_to @todolist, notice: 'Todolist was successfully updated.' }
        format.json { render :show, status: :ok, location: @todolist }
      else
        format.html { render :edit }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1
  # DELETE /todolists/1.json
  def destroy
    @todolist.destroy
    respond_to do |format|
      format.html { redirect_to todolists_url, notice: 'Todolist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todolist
      @todolist = Todolist.find(params[:id])
    end

    def set_default_todolist
      @todolist = Todolist.today.first || Todolist.create
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todolist_params
      params.fetch(:todolist, {})
    end

    def params_todoitem
      params.require(:todoitem).permit(:name)
    end


    def get_completed_lists
      @completed_lists = Todolist.where(percent: 100)
      @events = []
      @completed_lists.each do |list|
        @events << {
          name: list.id,
          start: list.created_at
        }
      end
    end

    def set_number_of_calendar
      @n_o_calendar = params[:multiple_calendar] || 1
    end
end

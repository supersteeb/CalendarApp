class TodoitemsController < ApplicationController
  before_action :set_todoitem, only: [:show, :edit, :update, :destroy, :toggle_status]

  # GET /todoitems
  # GET /todoitems.json
  def index
    @todoitems = Todoitem.all
  end

  # GET /todoitems/1
  # GET /todoitems/1.json
  def show
  end

  # GET /todoitems/new
  def new
    @todoitem = Todoitem.new
  end

  # GET /todoitems/1/edit
  def edit
  end

  # POST /todoitems
  # POST /todoitems.json
  def create
    @todoitem = Todoitem.new(todoitem_params)

    respond_to do |format|
      if @todoitem.save
        format.html { redirect_to @todoitem, notice: 'Todoitem was successfully created.' }
        format.json { render :show, status: :created, location: @todoitem }
      else
        format.html { render :new }
        format.json { render json: @todoitem.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_status
    @todoitem.toggle! :is_done #exclamation point
    update_list_completion
    respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render template: 'todoitems/edit_item.js.erb' }
    end
  end

  def update_list_completion
    list = @todoitem.todolist
    puts "\n\n\n List_ID: #{list.id} \n\n\n"
    all_items = list.todoitems.count
    puts "\n\n\n All item: #{all_items} \n\n\n"
    completed_items = list.todoitems.done.count
    puts "\n\n\n Completed item: #{completed_items} \n\n\n"
    percent_complete = (completed_items.to_f / all_items.to_f)*100
    list.update percent: percent_complete.to_i
  end

  # PATCH/PUT /todoitems/1
  # PATCH/PUT /todoitems/1.json
  def update
    @todoitem.update(todoitem_params)
    update_list_completion
    redirect_back(fallback_location: root_path)
  end

  # DELETE /todoitems/1
  # DELETE /todoitems/1.json
  def destroy
    @todoitem.destroy
    respond_to do |format|
      format.html { redirect_to todoitems_url, notice: 'Todoitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todoitem
      @todoitem = Todoitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todoitem_params
      params.require(:todoitem).permit(:desc, :result, :is_done)
    end
end

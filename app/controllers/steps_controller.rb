class StepsController < ApplicationController
  # before_action :set_list

  # GET /steps
  def index
    @list = List.find(params[:list_id])
    @steps = @list.steps
  end

  # GET /steps/1
  def show
    @list = List.find(params[:list_id])
    @step = @list.steps.find(params[:id])
  end

  # GET /steps/new
  def new
    @list = List.find(params[:list_id])
    @step = Step.new
  end

  # GET /steps/1/edit
  def edit
    @step = Step.find(params[:id])
  end

  # POST /steps
  def create
    @list = List.find(params[:list_id])
    @step = @list.steps.build(step_params)

    if @step.save
      redirect_to @list, notice: 'Step was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /steps/1
  def update
    if @list.step.update(step_params)
      redirect_to lists_path, notice: 'Step was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /steps/1
  def destroy
    @list = List.find(params[:list_id])
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to @list, notice: 'Step was successfully destroyed.'
  end

  private
    def step_params
      params.require(:step).permit(:name)
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    def list_params
      params.require(:list).permit(:name, :list_id)
    end
end

class AssigmentsController < ApplicationController
  before_action :set_assigment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: :create
  # GET /assigments
  # GET /assigments.json
  def index
    @topic = Topic.find(params[:topic_id])
    @assigments = @topic.assigments.order('id ASC')
  end

  # GET /assigments/1
  # GET /assigments/1.json
  def show
    topic = Topic.find(params[:topic_id])
    @assigment = topic.assigments.find(params[:id])
  end

  # GET /assigments/new
  def new
    topic = Topic.find(params[:topic_id])
    @assigment = topic.assigments.build
  end

  # GET /assigments/1/edit
  def edit
    topic = Topic.find(params[:topic_id])
    @assigment = topic.assigments.find(params[:id])
  end

  # POST /assigments
  # POST /assigments.json
  def create
    topic = Topic.find(params[:topic_id])
    @assigment = topic.assigments.new(assigment_params)
    respond_to do |format|
      if @assigment.save
        format.html { redirect_to ([@assigment.topic, @assigment]), notice: 'Assigment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /assigments/1
  # PATCH/PUT /assigments/1.json
  def update
    topic = Topic.find(params[:topic_id])
    @assigment = topic.assigments.find(params[:id])
    respond_to do |format|
      if @assigment.update_attributes(assigment_params)
        format.html { redirect_to ([@assigment.topic, @assigment]), notice: 'Assigment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /assigments/1
  # DELETE /assigments/1.json
  def destroy
    topic = Topic.find(params[:topic_id])
    @assigment = topic.assigments.find(params[:id])
    @assigment.destroy
    respond_to do |format|
      format.html { redirect_to topic_assigments_url, notice: 'Assigment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assigment
      topic = Topic.find(params[:topic_id])
      @assigment = topic.assigments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assigment_params
      params.require(:assigment).permit(:title, :due_time, :description, :topic_id)
    end
end

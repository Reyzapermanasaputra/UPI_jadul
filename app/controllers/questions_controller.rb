class QuestionsController < ApplicationController
  load_and_authorize_resource except: :create
  def index
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:evaluation_id])
    @questions = @evaluation.questions
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:evaluation_id])
    @question = @evaluation.questions.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:evaluation_id])
    @question = @evaluation.questions.build
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:evaluation_id])
    @question = @evaluation.questions.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:evaluation_id])
    @question = @evaluation.questions.find(params[:id])
    if @question.update_attributes(params_question)
      redirect_to [@topic, @evaluation], :notice => "Successfully"
    else
      render 'new'
    end
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:evaluation_id])
    @question = @evaluation.questions.create(params_question)
    if @question.save
      redirect_to [@topic, @evaluation], :notice => "Successfully"
    else
      render 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:evaluation_id])
    @question = @evaluation.questions.find(params[:id])
    @question.destroy
    redirect_to [@topic, @evaluation], :notice => "Successfully"
  end

  private
  def params_question
    params.require(:question).permit(:text)
  end
end

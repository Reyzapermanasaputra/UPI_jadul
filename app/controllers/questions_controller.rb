class QuestionsController < ApplicationController
  load_and_authorize_resource except: :create
  def index
    @topic = Topic.find(params[:topic_id])
    @questions = @topic.questions.order('id ASC')
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.build
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:id])
    if Question.update_attributes(params_question)
      redirect_to topic_questions_url, :notice => "Successfully"
    else
      render 'new'
    end
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.create(params_question)
    if @question.save
      redirect_to topic_questions_url, :notice => "Successfully"
    else
      render 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:id])
    @question.destroy
    redirect_to topic_questions_url, :notice => "Successfully"
  end

  private
  def params_question
    params.require(:question).permit(:text)
  end
end

class QuizzesController < ApplicationController
http_basic_authenticate_with name: "rey", password: "test", only: :start


  def index
  end

  def start
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:id])
    @question = @evaluation.questions
    all = @question.map {|x| x.id}

    session[:total]   = all.count
    total = session[:total].to_i
    session[:questions] = all.sort[0..(total - 1)]
    session[:current] = 0
    session[:correct] = 0
    session[:total] = total
	 redirect_to :action => "question"
  end

  def question
	 @current = session[:current]
	 @total   = session[:total]

         @topic = Topic.find(params[:topic_id])
         @evaluation = @topic.evaluations.find(params[:id])

         @question = @evaluation.questions.count
         @quiz = @evaluation.quizzes.new
         1.times { @quiz.tasks.build }


	 session[:question] = @question
	 session[:choices] = @choices
  end

  def answer
    @evaluation = Evaluation.find(params[:id])
    @quiz = @evaluation.quizzes.new(quiz_params)
    @quiz.user_id = current_user.id
    if @quiz.save
      redirect_to [@evaluation.topic, @evaluation], notice: "Thank a lot"
    else
      flash[:danger] = "quiz failed"
      redirect_to (:back)
    end
	 #@current = session[:current]
	 #@total   = session[:total]
	 #choiceid = params[:choice]

	 #@question = session[:question]
	 #@choices  = session[:choices]

	# @choice = choiceid ? Choice.find(choiceid) : nil
	 #if @choice and @choice.correct
	#	@correct = true
	#	session[:correct] = 1
	# else
	#	@correct = false
	# end
       #  redirect_to action: "end"

  end

  def end
	 @correct = session[:correct]
	 @total   = session[:total]

	 @score = @correct * 100 / @total
  end
  private

  def quiz_params
    params.require(:quiz).permit(:id, :user_id, :evaluation_id, :tasks_attributes =>[:id, :question_id,  :answer, :_destroy])
  end
end

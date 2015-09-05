class ScoresController < ApplicationController


  def create
    @topic = Topic.find(params[:topic_id])
    @evaluation = @topic.evaluations.find(params[:evaluation_id])
    @quiz = @evaluation.quizzes.find(params[:quiz_id])
    @count = @evaluation.questions.count
    params["scores"].each do |puppy|
      @quiz.scores.create(score_params(puppy))
    end
    redirect_tso (:back)
 end

 private

 def score_params(my_params)
   my_params.permit(:quiz_id, :value)
 end

end

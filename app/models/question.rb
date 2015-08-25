class Question < ActiveRecord::Base
  belongs_to :evaluation
  has_many :choices, :dependent => :destroy
  accepts_nested_attributes_for :choices, reject_if: lambda { |a| a[:text].blank? }, allow_destroy: true


 def answer
    uncorrect
    choices.select {|c| c.correct}[0]
  end

  def uncorrect
    choices.each {|c| c.correct = false}
  end

  def answer= choice
    if !answer.nil?
      answer.correct = false
    end

    if choices.include? choice
      choice.correct = true
    else
      choices << choice
      choice.correct = true
    end
  end
end

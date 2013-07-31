module QuestionsHelper

  def path_to_view(quest)
    params[:action] == 'index' ? question_path(quest) : edit_question_path(quest)
  end

end

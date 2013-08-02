module QuestionsHelper

  def path_to_view(quest)
    params[:action] == 'index' ? question_path(quest) : edit_question_path(quest)
  end


  def code_highlight(code)
    html = CodeRay.scan(code, :ruby).div(:line_numbers => :table)
    RedCloth.new(html).to_html
  end

end

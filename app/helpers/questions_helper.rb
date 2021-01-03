module QuestionsHelper
  def question_header(question)
    if question.new_record?
      I18n.t("pages.questions.new.header", test_title: question.test.title)      
    else
      I18n.t("pages.questions.edit.header", test_title: question.test.title)
    end
  end
end

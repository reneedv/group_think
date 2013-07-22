require 'spec_helper'

feature "Deleting questions" do
  let!(:question) { Factory(:question) }

  scenario "Deleting a question" do
    visit "/"
    click_link question.question
    click_link "Delete Question"
    page.should have_content("Question has been deleted.")

    visit "/"
    page.should_not have_content(question.question)
  end
end

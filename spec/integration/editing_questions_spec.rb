require "spec_helper"

feature "Editing Questions" do
  let!(:question) { Factory(:question) }

  before do
    sign_in_as!(Factory(:user))
    visit "/"
    click_link question.question
    click_link "Edit or Answer Question"
  end

  scenario "Updating a question" do
    fill_in "Question", :with => "To be or not to be?"
    click_button "Update Question"
    page.should_not have_content(question.question)
    page.should have_content("Question Updated")
  end

end


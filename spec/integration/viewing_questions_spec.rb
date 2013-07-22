require "spec_helper"

feature "View Questions" do
  let!(:question) { Factory(:question) }

  scenario "Viewing a Question" do
    sign_in_as!(Factory(:user))
    visit "/"
    page.should have_content question.question
    click_link question.question
    page.current_url.should == question_url(question)
  end
end

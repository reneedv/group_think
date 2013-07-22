require "spec_helper"

feature "Creating Questions" do

  scenario "Can create a question" do
    visit "/"
    click_link "New Question"
    fill_in "Question", :with => "Why is the sky blue?"
    click_button "Ask Question"
    page.should have_content("QQQuestion asked!")
  end

end

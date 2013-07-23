require "spec_helper"

feature "Creating Questions" do
  let!(:user) { Factory(:user) }

  scenario "Can create a question" do
    sign_in_as!(user)
    visit "/"
    click_link "New Question"
    fill_in "Question", :with => "Why is the sky blue?"
    click_button "Create Question"
    page.should have_content("QQQuestion asked!")
    within("#ticket #author") do
      page.should have_content("asked by #{user.email}")
    end
  end

end

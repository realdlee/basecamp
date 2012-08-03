require 'spec_helper'

describe List do

  before :each do
    visit new_user_registration_path
    @email = Faker::Internet.email
    fill_in "Email", :with => @email
    fill_in "Password", :with => "password"
    fill_in "user_password_confirmation", :with => "password"
    click_button "Sign up"
    @user = User.find_by_email(@email)
  end

  context "#new#create#show" do
    it "Allows a user to create a new ToDo list" do
      click_link "Create a New Project"
      title = Faker::Name.name
      fill_in "project_title", :with => title
      choose "project_public_0"
      click_button "Create Project"
      click_link "New Todo"
      title = Faker::Lorem.sentence
      fill_in "list_title", :with => title
      click_button "Create List"
      page.should have_content(title)
    end
  end

end
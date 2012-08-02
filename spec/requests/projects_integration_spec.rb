require "spec_helper"

describe Project do

  before :each do
    visit new_user_registration_path
    @email = Faker::Internet.email
    fill_in "Email", :with => @email
    fill_in "Password", :with => "password"
    fill_in "user_password_confirmation", :with => "password"
    click_button "Sign up"
    @user = User.find_by_email(@email)
  end

  context "Project#index" do
    it "show all projects that the user created" do
      @user.projects.create(title: "Hacker News Clone", public: 1)
      click_link('Home')
      page.should have_content("Hacker News Clone")
    end
  end

  context "#new" do

    it "allows a user ot create a project" do
      click_link "New Project"
      title = Faker::Name.name
      fill_in "project_title", :with => title
      choose "project_public_0"
      click_button "Create Project"
      page.should have_content(title)
    end

    it "validates presence of title and public status" do
      click_link "New Project"
      fill_in "project_title", :with => ""
      choose "project_public_0"
      click_button "Create Project"
      page.should have_content("Project must have a title, and public status.")
    end

  end

end

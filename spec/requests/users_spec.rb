require 'spec_helper'

describe User do

  context "devise" do

    it "allows a user to sign in" do
      visit new_user_registration_path
      fill_in "Email", :with => "name@test.com"
      fill_in "Password", :with => "password"
      fill_in "user_password_confirmation", :with => "password"
      click_button "Sign up"
      User.find_by_email("name@test.com").should be
    end

  end

end
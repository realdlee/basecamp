require 'spec_helper'

describe ListsController do
  render_views
  include Devise::TestHelpers
  before :each do
    @user = Fabricate(:user)
    sign_in @user
  end

  describe "#new" do
    it "assigns a new list instance" do
      get(:new)
      assigns(:list).should be_new_record
    end

    it "assigns the project id" do
      get(:new, :project_id => 5)
      assigns(:project_id).should == '5'
    end
  end

  describe "#create" do
    context "when given valid params" do
      before :each do
        project = Project.new(:public => true, :title => 'blah')
        project.user = @user
        project.save!
        post(:create, :project_id => project.id, :list => { :title => 'blah' })
      end

      it "saves the list" do
        assigns(:list).should be_persisted
      end

      it "redirects to the list" do
        response.should redirect_to(list_path(assigns(:list)))
      end
    end
    context "when given invalid params" do
      before :each do
        project = @user.projects.create(:public => true, :title => 'blah')
        post(:create, :project_id => project.id)
      end

      it "does not save the list" do
        assigns(:list).should_not be_persisted
      end

      it "renders the new template" do
        response.should render_template('new')
      end

      context "when given an invalid project id" do
        it "breaks" do
          expect {
            post(:create, :project_id => 500)
          }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
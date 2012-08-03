require 'spec_helper'

describe TasksController do
  render_views

  include Devise::TestHelpers
  before :each do
    @user = Fabricate(:user)
    sign_in @user
  end

  describe "#create" do
    context "given valid params" do
      before :each do
        project = @user.projects.new(:title => "Basecamp", :public => true)
        project.save!
        list = project.lists.create(:title => "Testing")
        post(:create, :list_id => list.id, :task => { :description => "Write Capybara tests" })
      end

      it "saves a task" do
        assigns(:task).should be_persisted
      end

    end

    context "given invalid params" do
      before :each do
        project = @user.projects.create(:public => true, :title => 'blah')
        @list = project.lists.create(:title => "Testing")
        post(:create, :list_id => @list.id)
      end

      it "does not save a task" do
        assigns(:task).should_not be_persisted
      end
    end

    context "when given an invalid id" do
      it "breaks" do
        expect {
          post(:create, :list_id => 20)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end

    end


  end


end

class Project < ActiveRecord::Base
  attr_accessible :title, :user_id, :public
  
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  validates_presence_of :public, :on => :create, :message => "can't be blank"
  belongs_to :user
end

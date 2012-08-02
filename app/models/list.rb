class List < ActiveRecord::Base
  attr_accessible :title, :project_id
  validates_presence_of :title, :project_id

  belongs_to :project
  has_many :tasks
end

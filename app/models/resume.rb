class Resume < ActiveRecord::Base

  belongs_to :user
  has_many :skills
  has_many :educations
  has_many :projects
  has_many :work_histories

  accepts_nested_attributes_for :skills, :allow_destroy => true
  accepts_nested_attributes_for :work_histories, :allow_destroy => true
  accepts_nested_attributes_for :projects, :allow_destroy => true
  accepts_nested_attributes_for :educations, :allow_destroy => true
end

class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :skills
  has_many :educations
  has_many :projects
  has_many :work_histories
end

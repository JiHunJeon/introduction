class Resume < ActiveRecord::Base

  belongs_to :user
  has_many :skills, :dependent => :destroy
  has_many :educations, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  has_many :work_histories, :dependent => :destroy

  accepts_nested_attributes_for :skills, :allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :work_histories, :allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :projects, :allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :educations, :allow_destroy => true, reject_if: :all_blank
end

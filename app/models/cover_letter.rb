class CoverLetter < ActiveRecord::Base
  belongs_to :user

  has_many :companies, :dependent => :destroy
  accepts_nested_attributes_for :companies, :allow_destroy => true, reject_if: :all_blank
end

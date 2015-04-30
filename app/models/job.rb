class Job < ActiveRecord::Base
  belongs_to :company
  has_many :likedjobs
  has_many :likes, through: :likedjobs, source: :user
  has_many :jobtags
  has_many :tags, through: :jobtags
  has_many :hiddenjobs

  validates :position, :description, :source, presence: true

  before_validation { |job| job.posting_date = Date.today if !job.posting_date }
end

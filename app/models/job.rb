class Job < ActiveRecord::Base
  belongs_to :company
  has_many :userjobs
  has_many :users, through: :userjobs

  validates :position, :description, :source, presence: true

  before_validation { |job| job.posting_date = Date.today if !job.posting_date }
end

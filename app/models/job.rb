class Job < ActiveRecord::Base
  belongs_to :company

  validates :position, :description, :source, presence: true

  before_validation { |job| job.posting_date = Date.today if !job.posting_date }
end

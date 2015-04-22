class Job < ActiveRecord::Base
  belongs_to :company

  validates :position, :posting_date, :description, :company_id, presence: true
end

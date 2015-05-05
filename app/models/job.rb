class Job < ActiveRecord::Base
  belongs_to :company
  has_many :likedjobs
  has_many :likes, through: :likedjobs, source: :user
  has_many :jobtags
  has_many :tags, through: :jobtags
  has_many :hiddenjobs

  validates :position, :description, :source, presence: true

  before_validation { |job| job.posting_date = Date.today if !job.posting_date }

  scope :by_newest, -> { order("posting_date DESC") }
  default_scope { by_newest }

  def self.visible_for(user)
    _not_hidden(user)._not_liked(user)
  end

  def self._not_hidden(user)
    where.not(id: user.jobs_hidden.pluck(:id))
  end

  def self._not_liked(user)
    where.not(id: user.jobs_liked.pluck(:id))
  end
end

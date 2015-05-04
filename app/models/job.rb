class Job < ActiveRecord::Base
  belongs_to :company
  has_many :likedjobs
  has_many :likes, through: :likedjobs, source: :user
  has_many :jobtags
  has_many :tags, through: :jobtags
  has_many :hiddenjobs

  validates :position, :description, :source, presence: true

  before_validation { self.posting_date ||= Date.today }

  scope :by_newest, -> { order("posting_date DESC") }
  default_scope { by_newest }

  def self.visible_for(user)
    all.where.not(id: user.jobs_hidden.pluck(:id))
  end
end

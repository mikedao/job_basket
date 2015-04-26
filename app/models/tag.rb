class Tag < ActiveRecord::Base
  has_many :jobtags
  has_many :jobs, through: :jobtags

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end

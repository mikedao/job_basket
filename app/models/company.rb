class Company < ActiveRecord::Base
  after_create :get_info

  has_many :jobs

  validates :name, presence: true

  private

  def get_info
    CompanyWorker.perform_async(name, 5)
  end
end

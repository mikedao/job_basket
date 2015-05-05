class Company < ActiveRecord::Base
  after_create :get_info, :clean_url

  has_many :jobs

  validates :name, presence: true

  private

  def get_info
    CompanyWorker.perform_async(name, 5)
  end

  def clean_url
    if url && !url.start_with?("http")
      update_attributes(url: "http://#{url}")
    end
  end
end

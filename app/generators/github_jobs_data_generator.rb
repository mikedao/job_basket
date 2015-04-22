class GitHubJobsDataGenerator

  def self.call(data)
    data.each_with_index do |record, i|
      unless i == 0
        a = GitHubJobsData.new
        a.
  end
end
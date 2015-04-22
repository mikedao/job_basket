class GitHubService
  def initialize
    @connection = Faraday.new(url: "https://jobs.github.com/positions.json?")
  end

  def save_jobs_data
    data = parse(get_data(langague, location))
    JobsDataGenerator.call(data)
  end

  private

  def get_data(language, location)
    @connection.get do |req|
      req.url "description=#{language}&location=#{location}"
      req.params["get"] = generate_tables(GitHubDataMapper.table_names(language), language)
    end
  end

  def generate_tables(table_number, specifer=nil)
    GitHubTableQuery.format(table_number, specifer)
  end

  def parse(data)
    JSON.parse(data.body)
  end
end
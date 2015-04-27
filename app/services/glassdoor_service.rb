class GlassdoorService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://api.glassdoor.com/api")
  end

  def company(company_name)
    parse(@connection.get("api.htm?t.p=#{Figaro.env.glassdoor_partner_id}&t.k=#{Figaro.env.glassdoor_key}&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{company_name}"))
  end

  private

  def parse(response)
    results = exact_matches(JSON.parse(response.body)["response"])

    if results
      results.first
    end
  end

  def exact_matches(input)
    input["employers"].select do |employer|
      employer["exactMatch"] == true
    end
  end
end

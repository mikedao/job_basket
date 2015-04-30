class GlassdoorService
  attr_reader :connection, :parser

  def initialize(parser)
    @connection = Faraday.new(url: "http://api.glassdoor.com/api")
    @parser = parser.new
  end

  def company(company_name)
    parser.parse(@connection.get(url_params(company_name)))
  end

  private

  def url_params(company_name)
    ("api.htm?t.p=#{Figaro.env.glassdoor_partner_id}&
     t.k=#{Figaro.env.glassdoor_key}&
     userip=0.0.0.0&
     useragent=&
     format=json&
     v=1&
     action=employers&
     q=#{company_name}").gsub(/\s/, "")
  end
end

require "rails_helper"

RSpec.describe GlassdoorService do
  it "has a connection" do
    service = GlassdoorService.new(GlassdoorParser)

    expect(service.connection).to_not be_nil
  end

  it "hits glassdoor for company information" do
    VCR.use_cassette("glassdoor_service") do
      service = GlassdoorService.new(GlassdoorParser)

      result = service.company("Twitter")
      expect(result["ceo"]["name"]).to eq("Dick Costolo")
    end
  end
end

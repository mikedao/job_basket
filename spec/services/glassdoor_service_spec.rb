require "rails_helper"

RSpec.describe GlassdoorService do
  it "has a connection" do
    service = GlassdoorService.new

    expect(service.class).to eq(GlassdoorService)
  end

  it "hits glassdoor for company information" do
    service = GlassdoorService.new

    result = service.company("Twitter")
    expect(result["ceo"]["name"].class).to eq(String)
  end
end

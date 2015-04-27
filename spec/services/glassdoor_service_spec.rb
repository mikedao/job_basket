require "rails_helper"

RSpec.describe GlassdoorService do
  let(:service) { GlassdoorService.new }

  it "has a connection" do
    expect(service.class).to eq(GlassdoorService)
  end

  it "hits glassdoor for company information" do
    result = service.company("Twitter")
    expect(result["ceo"]["name"].class).to eq(String)
  end

  it "returns only exact matches" do
    result1 = service.company("My Company")
    result2 = service.company("My Therapy Company")

    expect(result1).to be_nil
    expect(result2.class).to eq(Hash)
    expect(result2["website"]).to eq("www.mytherapycompany.com")
  end
end

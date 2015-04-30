class GlassdoorParser
  def parse(response)
    results = exact_matches(JSON.parse(response.body)["response"]["employers"])
    if results
      results.first
    end
  end

  private

  def exact_matches(employers)
    employers.select do |employer|
      employer["exactMatch"] == true
    end
  end
end

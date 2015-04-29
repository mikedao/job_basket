class CompanyWorker
  include Sidekiq::Worker

  def perform(company, count)
    result = GlassdoorService.new(GlassdoorParser).company(company)
    if result
      Company.find_by(name: company).update_attributes(
        url: result["website"],
        industry: result["industry"],
        logo_url: result["squareLogo"],
        overall_rating: result["overallRating"].to_f,
        rating_description: result["ratingDescription"],
        cultureandvalues_rating: result["cultureAndValuesRating"].to_f,
        seniorleadership_rating: result["seniorLeadershipRating"].to_f,
        compensationandbenefits_rating: result["compensationAndBenefitsRating"].to_f,
        careeropportunities_rating: result["careerOpportunitiesRating"].to_f,
        worklifebalance_rating: result["workLifeBalanceRating"].to_f,
        recommendtofriends_rating: result["recommendToFriendRating"].to_f,
        ceo_name: result["ceo"] && result["ceo"]["name"],
        approval_rating: result["ceo"] && result["ceo"]["pctApprove"].to_i
        )
    end
  end
end

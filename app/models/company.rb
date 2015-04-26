class Company < ActiveRecord::Base
  after_create :get_info

  has_many :jobs

  validates :name, presence: true

  private

  def get_info
    result = GlassdoorService.new.company(name)
    if result
      update_attributes(
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
        recommendtofriends_rating: result["recommendToFriendRating"].to_f
        )
    end

    if result && result["ceo"]
      update_attributes(
        ceo_name: result["ceo"]["name"],
        approval_rating: result["ceo"]["pctApprove"].to_i
        )
    end

    if result && result["ceo"] && result["ceo"]["image"]
      update_attributes(ceo_picture: result["ceo"]["image"]["src"])
    end
  end
end

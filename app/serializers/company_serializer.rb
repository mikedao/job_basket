class CompanySerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :url,
             :location,
             :industry,
             :logo_url,
             :overall_rating,
             :rating_description,
             :cultureandvalues_rating,
             :compensationandbenefits_rating,
             :careeropportunities_rating,
             :worklifebalance_rating,
             :recommendtofriends_rating,
             :ceo_name,
             :ceo_picture,
             :approval_rating
end

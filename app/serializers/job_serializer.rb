class JobSerializer < ActiveModel::Serializer
  attributes :id, :position, :posting_date, :description, :location, :source,
             :relevant

  has_one :company
end

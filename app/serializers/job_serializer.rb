class JobSerializer < ActiveModel::Serializer
  attributes :id, :position, :posting_date, :description, :location, :source,
             :relevant

  belongs_to :company
end

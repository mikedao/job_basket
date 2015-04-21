class Jobtag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :job
end

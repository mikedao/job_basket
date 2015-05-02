class User < ActiveRecord::Base
  has_many :likedjobs
  has_many :jobs_liked, through: :likedjobs, source: :job
  has_many :hiddenjobs
  has_many :jobs_hidden, through: :hiddenjobs, source: :job

  validates :email, :username, presence: true

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid: auth.uid)
    user.email = auth.info.email
    user.username = auth.info.name
    user.profile_image_url = auth.info.image
    user.token = auth.credentials.token
    user.save

    user
  end
end

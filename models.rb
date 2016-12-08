class User < ActiveRecord::Base
  has_many :posts
  has_one :profile  # works

  has_many :reservations # works
  has_many :rooms, through: :reservations #works

  def full_name
    first_name.to_s + ' ' + last_name.to_s
  end
end

class Reservation < ActiveRecord::Base
  belongs_to :user #works
  belongs_to :room #works
end

class Room < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
end

class Profile < ActiveRecord::Base
  belongs_to :user
end

#I think** this allows app to have access to Post
class Post < ActiveRecord::Base
  belongs_to :user
end

class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments 
  has_many :likes

  def liked?(user)
    likes.exists?(user_id: user.id)
  end


end

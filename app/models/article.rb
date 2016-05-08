class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments 
  has_many :likes

  def maxliked?(user)
    likes.where(user_id: user.id).count > 100 
  end
end

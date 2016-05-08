class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :article, counter_cache: :like_count
end

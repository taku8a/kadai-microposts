class Micropost < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :micropost_users, through: :bookmarks, source: :user
  validates :content,presence: true, length: {maximum: 255}
  
  def already_bookmarked?(user)
    bookmarks.where(user_id: user.id).exists?
  end
  
  
end

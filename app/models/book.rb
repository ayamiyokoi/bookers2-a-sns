class Book < ApplicationRecord
	is_impressionable
	belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def self.looks(search, word)
                if search == "forward_match"
                    Book.where("title LIKE?","#{word}%")
                elsif search == "backward_match"
                    Book.where("title LIKE?","%#{word}")
                elsif search == "perfect_match"
                    Book.where(title: word)
                elsif search == "partial_match"
                    Book.where("title LIKE?","%#{word}%")
                else
                        Book.all
                end
  end

end

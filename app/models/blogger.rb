class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 31 }

  def total_likes
    self.posts.sum(:likes)
  end

  def featured_post
    self.posts.order(likes: :desc).first
  end

  def top_5_written_about_destinations
    self.destinations.sort_by { |destination| destination.num_posts }.reverse![0...5]
  end
end

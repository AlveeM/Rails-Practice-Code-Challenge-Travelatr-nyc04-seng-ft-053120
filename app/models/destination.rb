class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def num_posts
    self.posts.count
  end

  def most_recent_5_posts
    self.posts.order(created_at: :desc).limit(5)
  end

  def featured_post
    self.posts.order(likes: :desc).first
  end

  def average_age_bloggers
    self.bloggers.average(:age).to_i
  end
end

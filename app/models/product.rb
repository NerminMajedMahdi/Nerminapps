class Product < ApplicationRecord
  has_many :comments
  validates :name, :description, :colour, :price, :presence => true
  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end
  private
    def image_size_validation
      errors[:image_url] << "should be larger than 50KB" if image_url.size < 0.05.megabytes
    end
 end
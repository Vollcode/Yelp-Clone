class Restaurant < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  def average_rating
    return 'N/A' if reviews.none?
    reviews.inject(0) {|previous_rating, review| previous_rating + review.rating} / reviews.length
  end


  def star_rating(rating)
    return rating unless rating.respond_to?(:round)
    remainder = (5 - rating.round)
    '★' * rating.round + "☆" * remainder
  end
end

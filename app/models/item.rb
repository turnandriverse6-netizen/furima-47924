class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  belongs_to :user
  has_one :order, dependent: :destroy
  belongs_to :category

  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_day
  belongs_to :prefecture
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, 
    numericality: {
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9999999 
    }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence: true
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :orders
         has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
         has_many :followings, through: :active_relationships, source: :follower

         has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
         has_many :followers, through: :passive_relationships, source: :following
         has_many :likes, dependent: :destroy
         
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date, presence: true
  validates :password,
          format: {
            with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
            message: 'must contain at least one number and one uppercase and lowercase character'
          },
          if: -> { password.present? }

  def followed_by?(user)
    follower =  passive_relationships.find_by(following_id: user.id)
    return follower.present?
  end
end

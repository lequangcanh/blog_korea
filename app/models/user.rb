class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post_translations, dependent: :destroy
  has_many :posts, through: :post_translations
  has_many :comments, dependent: :destroy

  validates :role, presence: true

  enum role: %i(normal moderator admin)
end

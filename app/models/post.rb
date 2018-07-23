class Post < ApplicationRecord
  has_many :post_translations, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :status, presence: true

  enum status: %i(active inactive)
end

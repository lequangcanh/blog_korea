class Language < ApplicationRecord
  validates :name, presence: true
  validates :short_name, presence: true, uniqueness: true

  scope :vietnamese, -> {Language.find_by short_name: "vi"}
  scope :korean, -> {Language.find_by short_name: "kr"}
  scope :english, -> {Language.find_by short_name: "en"}
end

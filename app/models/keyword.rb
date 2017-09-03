class Keyword < ApplicationRecord
  belongs_to :collection
  has_many :positions, dependent: :destroy
  validates :keyword, presence: true
end

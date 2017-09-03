class Image < ApplicationRecord
  belongs_to :collection
  has_many :positions, dependent: :destroy
  validates :image, presence: true, uniqueness: true
end

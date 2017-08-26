class Image < ApplicationRecord
  belongs_to :collection
  has_many :positions
  validates :image, presence: true, uniqueness: true
end

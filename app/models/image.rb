class Image < ApplicationRecord
  belongs_to :collection
  validates :image, presence: true, uniqueness: true
end

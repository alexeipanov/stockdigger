class Image < ApplicationRecord
  belongs_to :collection
  has_many :positions, dependent: :destroy
  validates :image, presence: true, uniqueness: { scope: :collection_id, message: 'possible duplicate' }
end

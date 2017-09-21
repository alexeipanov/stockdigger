class Keyword < ApplicationRecord
  belongs_to :collection
  has_many :positions, dependent: :destroy
  validates :keyword, presence: true, uniqueness: { scope: :collection_id, message: 'possible duplicate' }
end

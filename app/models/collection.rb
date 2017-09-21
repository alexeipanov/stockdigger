class Collection < ApplicationRecord
  belongs_to :user
  has_many :keywords, dependent: :destroy
  has_many :images, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :user_id, message: 'possible duplicate' }
end

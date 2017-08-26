class Keyword < ApplicationRecord
  belongs_to :collection
  has_many :positions
  validates :keyword, presence: true
end

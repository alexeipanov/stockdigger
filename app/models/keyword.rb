class Keyword < ApplicationRecord
  belongs_to :collection
  validates :keyword, presence: true
end

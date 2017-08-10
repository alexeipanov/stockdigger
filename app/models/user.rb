class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  has_many :images, dependent: :destroy

  # def self.from_token_payload payload
  #   # Returns a valid user, `nil` or raise
  #   # e.g.
  #   self.find payload["sub"]
  # end
  #
  # def self.from_token_request request
  #   # Returns a valid user, `nil` or raise `Knock.not_found_exception_class_name`
  #   # e.g.
  #   #   email = request.params["auth"] && request.params["auth"]["email"]
  #   #   self.find_by email: email
  # end

end

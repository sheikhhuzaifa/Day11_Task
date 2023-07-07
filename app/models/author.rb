# frozen_string_literal: true

class Author < ApplicationRecord
  validate :validate_email_domain
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters are allowed" }
  has_many :books, dependent: :destroy
  def validate_email_domain
    unless email =~ /\A[\w+\-.]+@gmail\.com\z/i
      errors.add(:email, "Only @gmail.com email addresses are allowed")
    end
  end
end

# frozen_string_literal: true

class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :username,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z0-9_\.]*\z/ }

  # associations
  has_one_attached :avatar, dependent: :destroy
  has_one :shelf, dependent: :destroy

  # instance methods
  def to_param
    username
  end
end

# rails g migration addAuthorToBooks author:references

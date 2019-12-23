# frozen_string_literal: true

require 'image_processing/mini_magick'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :generate_default_avatar

  # validations
  validates :username, presence: true

  # associations
  has_one_attached :avatar, dependent: :destroy
  has_one :shelf, dependent: :destroy

  def generate_default_avatar
    DefaultAvatar.new(self).attach_default_avatar
  end
end

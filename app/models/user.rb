# frozen_string_literal: true

require 'image_processing/mini_magick'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :generate_image

  # validations
  validates :username, presence: true

  # associations
  has_one_attached :avatar, dependent: :destroy
  has_one :shelf, dependent: :destroy

  def initial_name
    first_name.chr.capitalize
  end

  def generate_image
    MiniMagick::Tool::Convert.new do |image|
      image.size '200x200'
      image.gravity 'center'
      image.xc 'gray'
      image.pointsize 160
      image.font 'Umpush'
      image.fill('#ffffffff')
      image.draw "text 0,0 #{initial_name}"
      image << 'image.jpg'
    end
    avatar.attach(io: File.open('image.jpg'),
                  filename: 'test.jpg',
                  content_type: 'image/jpg')

    File.delete('image.jpg')
  end
end

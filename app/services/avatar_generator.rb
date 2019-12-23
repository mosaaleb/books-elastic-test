# frozen_string_literal: true

require 'image_processing/mini_magick'

class AvatarGenerator
  attr_reader :user

  def self.call(user)
    new(user).call
  end

  def initialize(user)
    @user = user
  end

  def call
    generate_image
    user.avatar.attach(io: File.open('default.jpg'),
                       filename: "#{user.username}-default.jpg",
                       content_type: 'image/jpg')

    clean
  end

  private

  def generate_image
    MiniMagick::Tool::Convert.new do |image|
      image.size '200x200'
      image.gravity 'center'
      image.xc 'gray'
      image.pointsize 100
      image.fill('#ffffffff')
      image.draw "text 0,0 #{initial_letters}"
      image << 'default.jpg'
    end
  end

  def initial_letters
    user.first_name.chr.capitalize + user.last_name.chr.capitalize
  end

  def clean
    File.delete('default.jpg')
  end
end

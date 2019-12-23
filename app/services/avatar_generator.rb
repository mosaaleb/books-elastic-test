# frozen_string_literal: true

require 'image_processing/mini_magick'

class AvatarGenerator
  attr_reader :user

  AVATAR_COLORS = { '#561B8D' => '#C8F7C5',
                    '#DFF0D8' => '#468847',
                    '#F0E68C' => '#F0E68C',
                    '#C8C8C8' => '#551700',
                    '#CD594A' => '#FFFFFF' }.freeze

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
    rand = rand 0..4
    MiniMagick::Tool::Convert.new do |image|
      image.size '200x200'
      image.gravity 'center'
      image.xc AVATAR_COLORS.keys[rand]
      image.pointsize 100
      image.fill AVATAR_COLORS.values[rand]
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
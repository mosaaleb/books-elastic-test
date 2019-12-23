# frozen_string_literal: true

namespace :users do
  desc 'Update users with no avatars to generate their defaults avatars'
  task generate_default_avatar: :environment do
    users = User
            .left_joins(:avatar_attachment).group(:id)
            .having('COUNT(active_storage_attachments) = 0')

    puts "Updating #{users.count} users avatars..."

    ActiveRecord::Base.transaction do
      users.each do |user|
        AvatarGenerator.call(user)
        print '.'
      end
    end

    puts "\nAll avatars updated successfully!"
  end
end

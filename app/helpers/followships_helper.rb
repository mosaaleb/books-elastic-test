# frozen_string_literal: true

module FollowshipsHelper
  def follow_button(author)
    if current_user.following?(author)
      link_to 'Unfollow', unfollow_author_path(author), method: :delete
    else
      link_to 'Follow', follow_author_path(author), method: :post
    end
  end
end

# frozen_string_literal: true

module ApplicationHelper
  def nav_bar
    render 'navbar' if current_user
  end

  def avatar(user, size)
    email_digest = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}?&s=#{size}"
    image_tag(gravatar_url, alt: user.username,
                            class: 'rounded-full border-2 border-transparent
                                    w-10 h-10 hover:border-indigo-400')
  end
end

# frozen_string_literal: true

module ApplicationHelper
  def nav_bar
    render 'navbar' if current_user
  end
end

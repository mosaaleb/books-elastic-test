# frozen_string_literal: true

class FollowshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(author)
    redirect_back(fallback_location: root_path)
    flash[:notice] = "You are now following #{author.name}"
  end

  private

  def author
    @author ||= Author.find_by(name: params[:name])
  end
end

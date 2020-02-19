# frozen_string_literal: true

class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all.take(20)
  end
end

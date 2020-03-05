# frozen_string_literal: true

class ShelvesController < ApplicationController
  def show
    @shelf_books = current_user.shelf.shelf_books
  end
end

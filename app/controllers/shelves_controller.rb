# frozen_string_literal: true

class ShelvesController < ApplicationController
  def show
    @shelf = current_user.shelf.shelf_books
  end
end

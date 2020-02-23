# frozen_string_literal: true

class BookAdditionsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.add_book_to_shelf(book)
    redirect_back(fallback_location: root_path)
    flash[:notice] = "Book #{book.title} is added to your library"
  end

  def destroy
    current_user.remove_book_from_shelf(book)
    redirect_back(fallback_location: root_path)
    flash[:notice] = "Book #{book.title} is removed from your library"
  end

  private

  def book
    @book ||= Book.find(params[:id])
  end
end

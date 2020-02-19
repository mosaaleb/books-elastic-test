# frozen_string_literal: true

class BookAdditionsController < ApplicationController
  def create
    current_user.add_book_to_shelf(book)
    flash[:notice] = "Book #{book.title} is added to your library"
  end

  private

  def book
    Book.find(params[:id])
  end
end

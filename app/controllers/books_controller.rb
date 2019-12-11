# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, flash: { notice: 'Book Added' }
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :isbn,
                                 :isbn13, :edition, :cover)
  end
end

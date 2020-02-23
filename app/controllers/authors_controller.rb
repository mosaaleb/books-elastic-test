# frozen_string_literal: true

class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by(name: params[:name])
    @books = @author.books
  end
end

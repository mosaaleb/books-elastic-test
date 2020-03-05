# frozen_string_literal: true

module BooksHelper
  def book_addition_button(book)
    if current_user.already_added?(book)
      link_to 'Remove book', remove_book_path(book), method: :delete
    else
      link_to 'Add book', add_book_path(book), method: :post
    end
  end

  def book_status(show_book_status, &block)
    content_tag(:div, &block) if show_book_status
  end

  def statuses_options
    BookAddition.statuses.map { |k, v| [k.humanize, v] }
  end
end

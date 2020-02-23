# frozen_string_literal: true

class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :username,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z0-9_\.]*\z/ }

  # associations
  has_one_attached :avatar, dependent: :destroy
  has_one :shelf, dependent: :destroy
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships, source: :author

  # instance methods
  def add_book_to_shelf(book)
    shelf.books << book
  end

  def already_added?(book)
    shelf.books.include?(book)
  end

  def remove_book_from_shelf(book)
    shelf.books.destroy(book)
  end

  def to_param
    username
  end

  def follow(author)
    followings << author
  end

  def unfollow(author)
    followings.destroy author
  end

  def following?(author)
    following_ids.include? author.id
  end
end

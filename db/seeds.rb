# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

ActiveRecord::Base.connection.reset_pk_sequence!('authors')
(1..20).each do |_i|
  Author.create!(name: Faker::Book.author)
end
p 'authors created'

ActiveRecord::Base.connection.reset_pk_sequence!('books')
Author.all.each do |author|
  20.times do
    book = author.books.new(title: Faker::Book.title,
                            description: Faker::Lorem.paragraph,
                            edition: Faker::Number.within(range: 1..5),
                            isbn: Faker::Number.unique.number(digits: 10),
                            isbn13: "978#{Faker::Number.unique.number(digits: 10)}")

    book.cover.attach(io: File.open('tmp/book-cover.jpg'),
                      filename: 'bookcover-sample.png',
                      content_type: 'image/jpg')
    book.save!
  end
end
p 'books created'

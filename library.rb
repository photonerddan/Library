
#Ruby Library Project MKS WEEK 1

class Book

  attr_reader :title, :author, :id
  attr_accessor :status

  def initialize(title = "unknown", author = "unknown")
    @title = title
    @author = author
    @status = "available"
    @id = nil


  end

end

class Library

  def initialize(name, location)
    @name = name
    @location = location
    @books_in_stock = Array.new
    @books_checked_out = Array.new
  end

  def add_book
  end

  def in_stock
  end

  def checked_out
  end

end


class Borrower

  attr_reader :name, :currently_borrowed

  def initialize
    @name = name
    @currently_borrowed = Array.new
  end

  def check_out(book)
  end

  def check_in(book)
  end
end
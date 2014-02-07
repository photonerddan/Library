
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

  def check_out
    @status = "checked_out"
  end

end

class Library

  def initialize(name, location)

    attr_accessor
    @name = name
    @location = location
    @books_in_stock = Array.new
    @books_checked_out = Array.new
  end

  def add_book
  end

  def check_out_book(book, borrower)
    book.check_out
    #@books_in_stock.delete(book)
    #@books_checked_out << {book => borrower}
  end

  def check_in_book(book, borrower)
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

  def check_out(library, book)
    library.check_out_book(book, self.name)
    @currently_borrowed << {book => library}
  end

  def check_in(book)
  end
end
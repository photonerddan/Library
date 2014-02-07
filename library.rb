
#Ruby Library Project MKS WEEK 1

class Book

  attr_reader :title, :author, :id
  attr_accessor :status

  def initialize(title = "unknown", author = "unknown", id = nil)
    @title = title
    @author = author
    @status = "available"
    @id = id
  end

  def check_out
    @status = "checked_out"
  end

  def check_in
    @status = "available"
  end
end



class Library

   attr_reader :books_in_stock

  def initialize(name, location)
    @name = name
    @location = location
    @book_count = 0
    @books_in_stock = Array.new
    @books_checked_out = Array.new
  end

  def add_book(title, author)
    @book_count += 1
    @books_in_stock << Book.new(title, author, @book_count)
  end

  def check_out_book(book, borrower)
    @books_in_stock.each{|x| in_stock = true if x === book}
    if in_stock
      book.check_out
      @books_in_stock.delete(book)
      @books_checked_out << {book => borrower}
      true
    else
      false
  end
end

  def check_in_book(book, borrower)
  end

  def in_stock
  end


end


class Borrower

  attr_reader :name, :currently_borrowed

  def initialize(name)
    @name = name
    @currently_borrowed = Array.new
  end

  def check_out(library, book)
    @currently_borrowed.each do|x|
     if x === book
       already_borrowed = true
     end
   end
   if !already_borrowed
     if library.check_out_book(book, self.name)
       @currently_borrowed << {book => library}
     else
      "This book is unavailable. Please check later.."
    end
   end
 end

  def check_in(book)
  end
end
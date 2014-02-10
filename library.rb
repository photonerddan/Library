
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

   attr_reader :books_in_stock, :books_checked_out, :name

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

  def check_out_book(book_id, borrower)
    book = @books_in_stock.find {|x| x if x.id === book_id}
    if !book.nil?
      book.check_out
      @books_checked_out << [book, borrower]
      @books_in_stock.delete(book)
      book
    else
      false
    end
  end

  def check_in_book(book_title, borrower)
    checked_out = false
    found_book = nil
    borrow_record = @books_checked_out.find do |x|
     if x[0].title === book_title
      found_book = x[0]
      checked_out = true
      x
     end
   end
   if checked_out
    found_book.check_in
    @books_in_stock << found_book
    @books_checked_out.delete(borrow_record)
  end
end

  def get_borrower(book_id)
    borrower = nil
    @books_checked_out.find { |x| borrower = x[1].name if x[0].id === book_id }
    borrower
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

  def check_out(library, book_title, book_id)
    already_borrowed = false
    if @currently_borrowed.length < 2
      @currently_borrowed.each do |x|
       if [book_title, library] === x
         already_borrowed = true
       end
     end
     if !already_borrowed
       if library.check_out_book(book_id, self.name)
         @currently_borrowed << [book_title, library]
         book_title
       else
        "This book is unavailable. Please check later.."
      end
     end
   else
    puts "Please return one of your other books first:"
    @currently_borrowed.each{|x| puts "#{x[0]} from #{x[1].name}"}
    nil
  end
end

  def check_in(book_title, library)
    found_book
    checked_out = false
    @currently_borrowed.find do |x|
      if x[0] === book_title
        check_out = true
        found_book = x
      end
    end
    if checked_out
      library.check_in_book(book_title, self.name)
      @currently_borrowed.delete(found_book)
    end
  end
end
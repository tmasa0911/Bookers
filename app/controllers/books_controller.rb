class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      flash[:notice] = "※error※"
      redirect_to ("/books")
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to ("/books")
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

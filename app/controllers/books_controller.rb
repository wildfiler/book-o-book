class BooksController <  ApplicationController
  def index
    @books = Book.all.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(book_id: @book.id).order("created_at DESC")
    @review = Review.new
    @user = current_user
    if signed_in?
      @user_review = @reviews.where(user_id: current_user.id)
    end
  end
end

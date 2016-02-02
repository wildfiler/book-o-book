class ReviewsController < ApplicationController
  before_action :set_review
  before_action :set_book
  before_action :require_login

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.build(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id
    if @review.save
      redirect_to @book
    else
      render :new
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    def review_params
      params.require(:review).permit(:comment)
    end
end

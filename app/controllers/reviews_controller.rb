class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_book

  def create
    @review = @book.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice]='Review was created succesful'
    else
      flash[:warning]='Error'
    end
    redirect_to @book
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

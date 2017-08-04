class ReviewsController < ApplicationController
  before_action :set_movie, only: [:new, :edit, :create, :update, :destroy]
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def edit
    @review = Review.includes(:movie).find(params[:id])
    @movie = @review.movie
  end

  def create
    @review = @movie.reviews.build(review_params)
    if @review.save
      (@movie.users - [current_user]).each do |user|
        UserMailer.notify_with_email(user).deliver_later
      end

      respond_to do |format|
        format.js
        format.html { redirect_to @movie }
      end
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    redirect_to @movie
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to @movie
  end

  private
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def review_params
      params.require(:review).permit(:content,:user_id)
    end
end

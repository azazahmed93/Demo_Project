class ReviewsController < ApplicationController
  #before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_movie, except: [:all]
  before_action :authenticate_user!

  def all
    @reports = Report.all
    @reviews = Review.all.page params[:page]
  end

  def new
    @review = Review.new
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def create
    @review=@movie.reviews.build(review_params)
    @review.save
    if @review.save
      respond_to do |format|
        format.js
        format.html { redirect_to @movie }
      end
    else
      #render 'new'
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
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def review_params
      params.require(:review).permit(:content,:user_id)
    end
end

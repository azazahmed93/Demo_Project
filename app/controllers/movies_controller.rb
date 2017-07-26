class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_filter :user_is_admin, only: [:new , :edit ,:create ,:destroy, :update]

  def index
    if params[:type] == "latest"
      @movies = Movie.order(year: :desc).page params[:page]
    elsif params[:type] == "featured"
      @movies = Movie.where(featured: true).page params[:page]
    elsif params[:type] == "top"
      @movies = Movie.order(rating: :desc).page params[:page]
    else
      @movies = Movie.order(created_at: :desc).page params[:page]
    end
  end

  def home
    @latest_movies = Movie.order(year: :desc).limit(4)
    @featured_movies = Movie.where(featured: true).limit(4)
    @top_movies = Movie.order(rating: :desc).limit(4)

  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def user_is_admin
      authorize! :manage, Movie
    end

    def movie_params
      params.require(:movie).permit(:title, :plot, :year, :genre, :time, :url, :rating, :featured,
                     posters_attributes:
                    [:id, :title, :file , :_destroy],
                     actors_attributes: [:id, :name, :_destroy], reviews_attributes: [:content, :user_id])
    end
end

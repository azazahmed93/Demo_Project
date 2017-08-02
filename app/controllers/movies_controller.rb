class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_filter :permit_movie, only: [:new , :edit ,:create ,:destroy, :update]

  def index
    if params[:type]
      @movies = Movie.fetch_movies(params).page(params[:page])
    else
      @movies = Movie.search(params[:search])
    end
  end

  def home
    @latest_movies = Movie.latest.limit(Movie::RECORDS_LIMIT)
    @featured_movies = Movie.featured.limit(Movie::RECORDS_LIMIT)
    @top_movies = Movie.top.limit(Movie::RECORDS_LIMIT)
  end

  def show
    @movie = Movie.includes(:reviews).find(params[:id])
    @reviews = @movie.reviews
    @actor_names = @movie.actors
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

  def favoritize
    @favorite = Favorite.new(movie_id: params[:curr_movie_id], user: current_user)
    @movie = Movie.find(params[:curr_movie_id])
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @movie, notice: 'Movie was Added to favorites.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { redirect_to @movie, notice: 'Already exists in your favorites.' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def permit_movie
      authorize! :manage, Movie
    end

    def movie_params
      params.require(:movie).permit(:title, :plot, :year, :genre, :time, :url, :rating, :featured,
                                     posters_attributes: [:id, :file, :_destroy],
                                     appearances_attributes: [:id, :actor_id, :movie_id, :role, :_destroy]
                                    )
    end
end

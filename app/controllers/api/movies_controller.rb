class API::MoviesController < API::BaseController
  def index
    @movies = Movie.fetch_movies(params)
    render json: @movies
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie
  end

  def search
    @movies = Movie.search(params[:search])
    render json: @movies
  end
end

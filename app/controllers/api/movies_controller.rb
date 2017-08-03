class API::MoviesController < ApplicationController
  def index
    @movies = Movie.fetch_movies(params)
    render json: @movies.as_json(only: [:id, :title, :year]), status: :created
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie.as_json(only: [:title, :year]), status: :created
  end

  def search
    @movies = Movie.search(params[:search])
    render json: @movies.as_json(only: [:title, :year]), status: :created
  end
end

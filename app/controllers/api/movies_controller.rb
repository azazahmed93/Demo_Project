class API::MoviesController < ApplicationController
  def index
    @movies = Movie.fetch_movies(params)
    render json: @movies.as_json(only: [:title, :year]), status: :created
  end

  def show

  end

  def search

  end
end

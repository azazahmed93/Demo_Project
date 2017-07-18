json.extract! movie, :id, :title, :plot, :year, :genre, :time, :url, :rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :year
  has_many :actors
end

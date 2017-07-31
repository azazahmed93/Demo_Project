class Appearance < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor

  validates_format_of :role, with: /^[a-z]+$/i, multiline: true
end

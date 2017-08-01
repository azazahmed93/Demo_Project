class Appearance < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor

  # validates :role, format: { with: /^[a-z]+$/i, multiline: true }
end

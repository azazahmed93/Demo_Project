class Poster < ActiveRecord::Base
  belongs_to :movie

  # attr_accessible :title, :file
  has_attached_file :file,
  styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg",
   "image/png", "image/gif", "application/pdf"]
end

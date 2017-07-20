class AddAttachmentFileToPhotos < ActiveRecord::Migration
  def change
  	add_attachment :posters, :file
  end
end

class Poster < ActiveRecord::Base
  belongs_to :movie
  has_attached_file :file,
                    styles: {
                      medium: '300x300>',
                      thumb: '100x100>'
                    },
                    default_url: ActionController::Base.helpers.asset_path('na.jpg')

  validates_attachment_content_type :file, content_type: ['image/jpg', 'image/jpeg',
                                    'image/png', 'image/gif', 'application/pdf']

  validates :file, presence: true
end

class Photo < ApplicationRecord
  enum status: [:in_progress, :rejected, :accepted]

  # Associations
  belongs_to :user

  # Validations
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 4.megabytes
end
class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  reverse_geocoded_by :latitude, :longitude

  # Associations
  has_many :user_photos
  has_many :photos, through: :user_photos
end

class RemoveUserIdFromPhotos < ActiveRecord::Migration[5.0]
  def change
    remove_reference :photos, :user, foreign_key: true
  end
end
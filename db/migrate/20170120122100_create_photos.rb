class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :user
      t.integer :status, null: false, default: 0
      t.integer :order, null: false, default: 0

      t.timestamps
    end

  end
end

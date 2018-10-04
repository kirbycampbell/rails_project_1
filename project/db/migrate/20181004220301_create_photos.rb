class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image_url
      t.belongs_to :user, index: true
      t.datetime :posted_at

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :published, default: false
      t.string :image, default: 'https://via.placeholder.com/150'
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

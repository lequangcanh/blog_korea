class CreatePostTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :post_transaltions do |t|
      t.references :language
      t.references :post
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

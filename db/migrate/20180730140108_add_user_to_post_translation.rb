class AddUserToPostTranslation < ActiveRecord::Migration[5.1]
  def change
    add_reference :post_translations, :user
  end
end

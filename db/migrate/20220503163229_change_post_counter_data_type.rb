class ChangePostCounterDataType < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :posts_counter
  end
end

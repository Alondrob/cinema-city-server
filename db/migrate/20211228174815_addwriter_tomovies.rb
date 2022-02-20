class AddwriterTomovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :writers, :string
  end
end

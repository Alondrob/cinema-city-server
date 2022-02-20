class CreateFavoriteMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_movies do |t|
      t.references :movie
      t.references :user
      t.timestamps
    end
  end
end

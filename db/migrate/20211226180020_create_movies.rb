class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :image
      t.references :actor
      t.text :plot
      t.integer :year
      t.integer :movie_length
      t.float :rating
      t.timestamps
    end
  end
end

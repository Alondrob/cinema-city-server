class CreateMovieActors < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_actors do |t|
      t.references :movie
      t.references :actor
      t.string :role
      t.timestamps
    end
  end
end

class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :imdb_id
      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.float :stars
      t.references :movie
      t.references :user
      t.text :content
      t.timestamps
    end
  end
end

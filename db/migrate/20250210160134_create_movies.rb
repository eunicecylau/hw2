class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string "movie_name"
      t.integer "year_released"
      t.string "MPAA_rating"
      t.integer "studio_id"
      t.timestamps
    end
  end
end

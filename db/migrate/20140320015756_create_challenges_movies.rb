class CreateChallengesMovies < ActiveRecord::Migration
  def change
    create_table :challenges_movies do |t|
      t.references :challenge, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end

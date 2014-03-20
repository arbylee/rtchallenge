class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :rt_id

      t.timestamps
    end
  end
end

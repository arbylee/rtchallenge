class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :score
      t.references :user, index: true
      t.references :movie, index: true
      t.references :challenge, index: true

      t.timestamps
    end
  end
end

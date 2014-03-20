class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.date :deadline

      t.timestamps
    end
  end
end

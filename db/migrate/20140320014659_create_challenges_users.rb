class CreateChallengesUsers < ActiveRecord::Migration
  def change
    create_table :challenges_users do |t|
      t.references :challenge, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

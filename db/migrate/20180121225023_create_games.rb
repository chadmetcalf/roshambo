class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :challenger, foreign_key: true
      t.jsonb :result

      t.timestamps
    end
  end
end

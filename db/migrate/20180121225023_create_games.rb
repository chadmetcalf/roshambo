class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :challenger, foreign_key: true
      t.string :state
      t.jsonb :result, default: {}

      t.timestamps
    end
  end
end

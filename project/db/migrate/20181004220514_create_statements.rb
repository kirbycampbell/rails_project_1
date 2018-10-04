class CreateStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :statements do |t|
      t.string :content
      t.belongs_to :topic, index: true
      t.datetime :posted_at

      t.timestamps
    end
  end
end

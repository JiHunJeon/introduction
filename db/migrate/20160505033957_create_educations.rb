class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :name
      t.string :text
      t.datetime :started_at
      t.datetime :ended_at
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateCoverLetters < ActiveRecord::Migration
  def change
    create_table :cover_letters do |t|
      t.text :text
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

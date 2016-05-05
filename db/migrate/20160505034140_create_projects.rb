class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :text
      t.string :hoem_page
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

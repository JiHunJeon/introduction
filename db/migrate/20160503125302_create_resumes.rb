class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.text :summary

      t.timestamps null: false
    end
  end
end

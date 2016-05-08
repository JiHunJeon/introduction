class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :hiring_agent_name
      t.string :address1
      t.string :address2
      t.string :post_code
      t.references :cover_letter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

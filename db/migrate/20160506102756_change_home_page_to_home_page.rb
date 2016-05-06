class ChangeHomePageToHomePage < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.rename :hoem_page, :home_page
    end
  end
end

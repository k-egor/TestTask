class CreateIncomeCategories < ActiveRecord::Migration
  def change
    create_table :income_categories do |t|
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateExpenseCategories < ActiveRecord::Migration
  def change
    create_table :expense_categories do |t|
      t.integer :user_id
      t.string :name
      
      t.timestamps null: false
    end
  end
end

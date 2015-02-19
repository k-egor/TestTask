class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :expense_category_id
      t.decimal :value
      t.date :date

      t.timestamps null: false
    end
  end
end

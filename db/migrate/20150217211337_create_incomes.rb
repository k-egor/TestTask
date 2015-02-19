class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :income_category_id
      t.decimal :value
      t.date :date

      t.timestamps null: false
    end
  end
end

class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :expense_category_id
      t.integer :income_category_id
      t.date :date_from
      t.date :date_to

      t.timestamps null: false
    end
  end
end

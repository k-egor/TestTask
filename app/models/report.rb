class Report < ActiveRecord::Base

def search_expenses
   
   expenses = Expense.joins(:expense_category)
   .select("expenses.*, expense_categories.name, expense_categories.id as exp_cat_id")
.where("expense_categories.user_id = ?", 1)#current_user.id)

   expenses = expenses.where("exp_cat_id = ?", expense_category_id) if expense_category_id.present?
   
   expenses = expenses.where("date between ? and ?", date_from, date_to) if date_from.present?
   
   
   return expenses
end

end

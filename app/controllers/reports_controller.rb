class ReportsController < ApplicationController

def new
	@report = Report.new
	@expense_categories = ExpenseCategory.where(user_id: current_user.id)
	@income_categories = IncomeCategory.where(user_id: current_user.id)
end

def show
	@report = Report.find(params[:id])
	@expenses = Expense.joins(:expense_category)
   .select("expenses.*, expense_categories.name")
.where("expense_categories.user_id = ?", current_user.id)

  if @report.expense_category_id.present?
     @expenses = @expenses.where("expense_category_id = ?", @report.expense_category_id) 
  end   
  if @report.date_from.present? && @report.date_to.present?  
     @expenses = @expenses.where("date between ? and ?", @report.date_from, @report.date_to)
  end 

  @incomes = Income.joins(:income_category)
   .select("incomes.*, income_categories.name")
.where("income_categories.user_id = ?", current_user.id)
  if @report.income_category_id.present?
     @incomes = @incomes.where("income_category_id = ?", @report.income_category_id) 
  end   
  if @report.date_from.present? && @report.date_to.present?  
     @incomes = @incomes.where("date between ? and ?", @report.date_from, @report.date_to)
  end
end

def create
	@report = Report.create(search_params)
	redirect_to @report
end

private

def search_params
params.require(:report).permit(:expense_category_id, :income_category_id, :date_from, :date_to)
end

end

class ExpenseCategory < ActiveRecord::Base

	has_many :expense
	belongs_to :user
end

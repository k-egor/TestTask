class IncomeCategory < ActiveRecord::Base

	has_many :income
	belongs_to :user
end

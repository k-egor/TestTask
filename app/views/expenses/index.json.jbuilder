json.array!(@expenses) do |expense|
  json.extract! expense, :id, :expense_category_id, :value, :date
  json.url expense_url(expense, format: :json)
end

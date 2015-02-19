json.array!(@incomes) do |income|
  json.extract! income, :id, :income_category_id, :value, :date
  json.url income_url(income, format: :json)
end

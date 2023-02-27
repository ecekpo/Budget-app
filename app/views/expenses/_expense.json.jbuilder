json.extract! expense, :id, :name, :amount, :decimal, :author_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)

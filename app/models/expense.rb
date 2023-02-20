class Expense < ApplicationRecord
  belongs_to :author

  belongs_to: author, class_name: 'User'
  has_many: grou_expenses, dependent: :destroy
  has_many :groups, through: :group_budgets, dependent: :destroy

end

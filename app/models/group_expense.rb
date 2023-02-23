class GroupExpense < ApplicationRecord
  belongs_to :expense, foreign_key: 'expense_id', class_name: 'Expense'
  belongs_to :group, foreign_key: 'group_id', class_name: 'Group'

  validates :group, presence: true
  validates :expense, presence: true
end

class Expense < ApplicationRecord
  belongs_to :author

  belongs_to: author, class_name: 'User'
  has_many: group_expenses, dependent: :destroy
  has_many: :groups, through: :group_budgets, dependent: :destroy

  validates :name, present: true, length: { minimum: 1, maximum 20 }, uniqueness: { scope: :author, message: 'You already have a transaction with this name' }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

end

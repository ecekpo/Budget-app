class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 20 },
                   uniqueness: { scope: :author, message: 'You already have a category with this name' }

  validates :icon, presence: true

  def calculate_expense
    sum = 0
    expenses.each do |expense|
      sum += expense.amount
    end
    sum
  end
end

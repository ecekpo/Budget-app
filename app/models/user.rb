class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, foreign_key: 'user_id', class_name: 'Group'
  has_many :expenses, foreign_key: 'user_id', class_name: 'Expense'

  validates :name, presence: true, length: { maximum: 25 }
end

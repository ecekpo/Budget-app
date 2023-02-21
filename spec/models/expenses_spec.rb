require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.create(name: 'Emem')
      @expense = Expense.new(author: @user, name: 'goodluck', amount: 1.99)
    end

    it 'is valid with valid attributes' do
      expect(@expense).to be_valid
    end

    it 'is not valid without a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'is not valid without an amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'is not valid without a user id' do
      @expense.author_id = nil
      expect(@expense).to_not be_valid
    end
  end
end
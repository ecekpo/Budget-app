require 'rails_helper'

Rspec.describe Expense, type: model do
    before :each do
       @user = User.create(name: 'Emem Ekpo')
       @expense = Expense.new(author: @user, name: 'Goodluck', amount: 2.00)
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

it 'has an amount that is a numeric data type' do
  expect(@expense.amount).to be_a_kind_of(Numeric)
end

it 'is not valid without a user id' do
  @expense.author_id = nil
  expect(@expense).to_not be_valid
 end

 end
end
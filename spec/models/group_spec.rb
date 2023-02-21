require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Emem') }
  let(:group) { described_class.new(author: user, name: 'Food', icon: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F285655%2Fuser_icon&psig=AOvVaw37joxjOi9Q-l0wVxr1h-Fm&ust=1677000866763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCKDu9tTRpP0CFQAAAAAdAAAAABAE') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'is not valid without a user id' do
      group.author_id = nil
      expect(group).to_not be_valid
    end

    it 'is not valid without an icon' do
      group.icon = nil
      expect(group).to_not be_valid
    end
  end
end
require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'relationships' do
    it { should have_many(:subscriptions) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:keywords) }
    it { should validate_presence_of(:origin) }
    it { should validate_presence_of(:brew_time) }
    it { should validate_presence_of(:temperature) }
  end
end

require 'rails_helper'

RSpec.describe Entity, type: :model do
  user = User.create(name: 'Tolib', email: 'tolib@mail.com', password: '123456')

  subject do
    described_class.new(name: 'Pizza',
                        amount: 12,
                        author: user)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with negative amount' do
    subject.amount = -5
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to :author }
    it { should have_and_belong_to_many :groups }
  end
end

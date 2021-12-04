require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Jack',
                        email: 'jack@mail.com',
                        password: '123456')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with the password, which length is less than 6 symbols' do
    subject.password = '12345'
    expect(subject).to_not be_valid
  end
end

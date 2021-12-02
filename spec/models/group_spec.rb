require 'rails_helper'

RSpec.describe Group, type: :model do
  user = User.last
  
  subject {
    described_class.new(name: "Foods",
                        icon: "foods",
                        user: user)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an icon" do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to :user }
    it { should have_and_belong_to_many :entities }
  end

end

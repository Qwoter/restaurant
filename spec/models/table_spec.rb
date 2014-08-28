require 'rails_helper'

RSpec.describe Table, :type => :model do
  it "has a valid factory" do
    expect(build(:table)).to be_valid
  end
  
  it "is invalid without number" do
    expect(build(:table, number: nil)).to_not be_valid
  end
end

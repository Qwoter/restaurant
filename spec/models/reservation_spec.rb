require 'rails_helper'

RSpec.describe Reservation, :type => :model do
  it "has a valid factory" do
    expect(build(:reservation)).to be_valid
  end

  it "start time can't be in past" do
    reservation = build(:reservation, start_time: Time.now - 10.hours, end_time: Time.now + 2.hours)
    expect(reservation).to_not be_valid
  end

  it "start time can't be less then end time" do
    reservation = build(:reservation, start_time: Time.now + 2.hours, end_time: Time.now + 1.hours)
    expect(reservation).to_not be_valid
  end

  it "should not intersect time with other reservation" do
    table = create(:table)
    reservation1 = create(:reservation, table: table, start_time: Time.now + 1.hour, end_time: Time.now + 2.hours)
    reservation2 = build(:reservation, table: table, start_time: Time.now + 1.hour, end_time: Time.now + 3.hours)
    expect(reservation2).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Booking, :type => :model do
    subject { 
        described_class.new(
            date: Date.tomorrow,
            start_time: Time.now,
            end_time: Time.now
        )
    }

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid without a date" do
        subject.date = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a start_date" do
        subject.start_time = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a end_date" do
        subject.end_time = nil
        expect(subject).to_not be_valid
    end
end

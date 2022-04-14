require 'spec_helper'
require 'calendar'

RSpec.describe 'calendar' do
  describe '.initialize' do
    it 'sets correct values' do
      expect(Calendar.new.months.size).to eq 12
      expect(Calendar.new.week.size).to eq 7
    end
  end

  describe '.kind_month' do
    it 'returns the correct quantity of days' do
      if [1, 3, 5, 7, 8, 10, 12].include?(Time.now.month)
        expect(Calendar.new.kind_month.size).to eq 31
      elsif Time.now.month == 2
        expect(Calendar.new.kind_month.size).to eq 28
      else
        expect(Calendar.new.kind_month.size).to eq 30
      end
    end
  end

  describe '.mark_today' do
    it 'marks the current day' do
      expect((Calendar.new.mark_today - Calendar.new.kind_month).size).to eq 1
    end
  end

  describe '.first_week_day_in_month' do
    it 'sets the first month day in week' do
      expect(Calendar.new.first_week_day_in_month).to be_a_kind_of(Integer)
    end
  end

  # describe '.adjust_output_month' do
  #   it 'inserts nil values in array' do
  #     expect(Calendar.new.adjust_output_month).to include("  ") 
  #   end
  # end

  describe '.display' do
    it 'returns the calendar' do
      expect(Calendar.new.display).to be_a_kind_of(Array)
    end
  end
end
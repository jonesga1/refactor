require 'minitest/autorun'
require './utilities'

# write tests here
describe 'Utilities' do

  describe 'leap_year?' do
    it 'Multiples of four are leap years' do
      leap_year?(2016).must_equal(true)
      leap_year?(2012).must_equal(true)
    end

    it 'Multiples of 100 are leap years when they are also multiples of 400' do
      leap_year?(400).must_equal(true)
      leap_year?(2000).must_equal(true)
    end

    it 'Multiples of 100 are not leap year when they are not multiples of 400' do
      leap_year?(1900).must_equal(false)
      leap_year?(1300).must_equal(false)
    end

    it 'Years that are not multiples of 4 are not leap years' do
      leap_year?(2017).must_equal(false)
      leap_year?(1933).must_equal(false)
    end
  end

  describe 'percent_year_in_seconds' do
    it '3153600 seconds is 10% of a year' do
      percent_year_in_seconds(3153600).must_equal('10.0%')
    end
    it '4000000 seconds is 12.7% of a year' do
      percent_year_in_seconds(4000000).must_equal('12.7%')
    end
  end

  describe 'convert_military_to_standard' do
    it 'Times in PM add 12' do
      convert_military_to_standard('3:50 PM').must_equal('15:50')
      convert_military_to_standard('4:20 PM').must_equal('16:20')
    end
    it 'Times in AM stay the same' do
      convert_military_to_standard('3:50 AM').must_equal('3:50')
      convert_military_to_standard('4:20 AM').must_equal('4:20')
    end
  end

  describe 'convert_standard_to_military' do
    it 'Times under 12 stay the same and add am' do
      convert_standard_to_military('3:50').must_equal('3:50 am')
    end
    it 'Times over 12 subtract 12 and add pm' do
      convert_standard_to_military('15:50').must_equal('3:50 pm')
    end
  end
end

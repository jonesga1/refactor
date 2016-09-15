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
end

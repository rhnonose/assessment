require 'rspec'
require 'numeral_converter'

describe NumeralConverter do

  it 'should convert single numbers' do
    NumeralConverter.convert(7).should == "seven"
    NumeralConverter.convert(1).should == "one"
    NumeralConverter.convert(0).should == "zero"
    NumeralConverter.convert(5).should == "five"
  end

  it 'should convert ten' do
    NumeralConverter.convert(10).should == "ten"
  end

  it 'should convert [11,19]' do
    NumeralConverter.convert(11).should == "eleven"
    NumeralConverter.convert(15).should == "fifteen"
    NumeralConverter.convert(19).should == "nineteen"
  end

  it 'should convert [21, 99]' do
    NumeralConverter.convert(45).should == "forty-five"
    NumeralConverter.convert(21).should == "twenty-one"
    NumeralConverter.convert(87).should == "eighty-seven"
  end

  it 'should convert [100, 999]' do
    NumeralConverter.convert(100).should == "one hundred"
    NumeralConverter.convert(101).should == "one hundred and one"
    NumeralConverter.convert(233).should == "two hundred and thirty-three"
    NumeralConverter.convert(587).should == "five hundred and eighty-seven"
  end

  it 'should convert [1000, 9999]' do
    NumeralConverter.convert(1587).should == "fifteen hundred and eighty-seven"
    NumeralConverter.convert(4732).should == "forty-seven hundred and thirty-two"
  end
end
class NumeralConverter

  UNIT_MAP = {
      "0" => "zero",
      "1" => "one",
      "2" => "two",
      "3" => "three",
      "4" => "four",
      "5" => "five",
      "6" => "six",
      "7" => "seven",
      "8" => "eight",
      "9" => "nine"
  }

  TEN_MAP = {
      "10" => "ten",
      "11" => "eleven",
      "12" => "twelve",
      "13" => "thirteen",
      "14" => "fourteen",
      "15" => "fifteen",
      "16" => "sixteen",
      "17" => "seventeen",
      "18" => "eighteen",
      "19" => "nineteen"
  }

  DEC_MAP = {
      "2" => "twenty",
      "3" => "thirty",
      "4" => "forty",
      "5" => "fifty",
      "6" => "sixty",
      "7" => "seventy",
      "8" => "eighty",
      "9" => "ninety"
  }

  def self.convert(number)
    if number < 0
      raise "Negative numbers not covered (yet)"
    end
    str_number = number.to_s

    case str_number.size
      when 1
        result_string = UNIT_MAP[str_number]
      when 2
        get_decimal(str_number)
      when 3
        UNIT_MAP[str_number[0]] + " hundred" +
            (get_decimal(str_number[1,2]) == nil ? "" : " and "  + get_decimal(str_number[1,2]))
      when 4
        get_decimal(str_number[0,2]) + " hundred and " + get_decimal(str_number[2,3])
    end
  end

  def self.get_decimal(str_number)
    if str_number.to_i == 0
      nil
    elsif str_number.to_i < 10
      UNIT_MAP[str_number[1]]
    elsif str_number.to_i < 20
      TEN_MAP[str_number]
    else
      DEC_MAP[str_number[0]] + "-" + UNIT_MAP[str_number[1]]
    end
  end

end
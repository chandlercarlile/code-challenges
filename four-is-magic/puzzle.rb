# frozen_string_literal: true

NUMBER_NAMES = {
  trillion:  1000000000000,
  billion:   1000000000,
  million:   1000000,
  thousand:  1000,
  hundred:   100,
  ninety:    90,
  eighty:    80,
  seventy:   70,
  sixty:     60,
  fifty:     50,
  forty:     40,
  thirty:    30,
  twenty:    20,
  nineteen:  19,
  eighteen:  18,
  seventeen: 17,
  sixteen:   16,
  fifteen:   15,
  fourteen:  14,
  thirteen:  13,
  twelve:    12,
  eleven:    11,
  ten:       10,
  nine:      9,
  eight:     8,
  seven:     7,
  six:       6,
  five:      5,
  four:      4,
  three:     3,
  two:       2,
  one:       1,
  zero:      0,
}

def count_thousands(number)
  string_number = ""
  hundreds_digit = number.first
  tens_digit = number[1]
  ones_digit = number.last

  string_number << (NUMBER_NAMES.key(hundreds_digit.to_i).to_s + " hundred") unless hundreds_digit == 0
  if tens_digit == "1"
    string_number << " " + NUMBER_NAMES.key((tens_digit + ones_digit).to_i).to_s
  elsif tens_digit == "0"
    string_number << " " + NUMBER_NAMES.key(ones_digit.to_i).to_s unless ones_digit == "0"
  else
    string_number << " " + NUMBER_NAMES.key((tens_digit + "0").to_i).to_s
    string_number << " " + NUMBER_NAMES.key(ones_digit.to_i).to_s unless ones_digit == "0"
  end

  return string_number << " thousand"
end

# count_thousands(123456.to_s.split("").reverse[0..2].reverse)

def count_hundreds(number)

end

def count_characters(string_number)

end

def prove_four_is_magic(number)
  word_string = ""

  reverse_numbers_array = number.to_s.split("").reverse

  # count_millions if number.to_s.length = 7
  word_string + count_thousands(reverse_numbers_array[3..5].reverse)
  word_string + " " + count_hundreds(reverse_numbers_array[0..2].reverse)

  character_count = count_characters(word_string.strip)

  puts(character_count)
end

##### Script Start #####

puts "Hello! Please enter a number between 1 and 1,000,000"

number = gets.chomp

prove_four_is_magic(number)

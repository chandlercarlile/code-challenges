class WeightedNumberGeneration
  require 'json'
  attr_accessor :weights

  def self.generate(weights)
    new(weights).generate
  end

  def initialize(weights)
    self.weights = weights
  end

  def generate
    weighted_hash = ::JSON.parse(weights).to_h

    transformed_weighted_hash = transform_decimals(weighted_hash)

    select_from_hash(transformed_weighted_hash)
  end

  private

  def transform_decimals(hash)
    # grab all of the decimals
    floats = hash.select { |_k, v| v.kind_of?(Float) }.values

    return hash if floats.empty?

    # map them through digits_after_decimal, find max
    largest_decimal_place = floats.map { |num| digits_after_decimal(num) }.max

    # multiply all values to remove decimals from hash
    # round because there is occasionally weird float issues
    hash.transform_values{ |v| (v * (10 ** largest_decimal_place)).round }
  end

  def digits_after_decimal(number)
    split = number.to_s.split(".")

    return 0 if split.length == 1
    return 0 if split[1].to_f.zero?

    split[1].length
  end

  def select_from_hash(hash)
    expanded_values = []

    hash.each do |key, value|
      value.times do
        expanded_values << key
      end
    end

    selected_index = rand(0..expanded_values.length - 1)
    expanded_values[selected_index]
  end
end

# copy-paste into IRB

# WeightedNumberGeneration.generate('{"hello": 1, "world": 9.0, "again": 5.3}')
# 10000.times.map { WeightedNumberGeneration.generate('{"hello": 1, "world": 9.0, "again": 5.3}') }.tally.sort_by { |k,v| v }
# 100.times.map { WeightedNumberGeneration.generate('{"hello": 1, "world": 9.0, "again": 5.3}') }
# {"hello": 1, "world": 9.0, "again": 5.3, "another_one": 67.24}

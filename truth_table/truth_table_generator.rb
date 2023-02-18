boolean_expression = ARGV[0]

puts "Hello! You entered #{boolean_expression}"

# Find the non !()||&& characters
variables = boolean_expression.gsub(/\W+/, "").chars.uniq
puts "variables: #{variables}"

puts "Truth Table"

# generate a permutation of 0 and 1 for the number of variables
truth_table = ["0", "1"].repeated_permutation(variables.size).map { |values| variables.zip(values).to_h }

# print table "header"
puts(variables.join(" | ") + " |  \"" + boolean_expression + "\"")
puts("-------------------------------")

# for each permutation, sub in the 0/1 for that row
# then swap 0/1 with false/true
# then eval the resulting string (ruby can boolean eval "true" and "false" strings?!?!?!)
# print result, along side the row of the table we are evaluating
truth_table.each do |hash|
  truth_result = boolean_expression.dup

  variables.each do |var|
    truth_result.gsub!(var, hash[var])
  end

  truth_result.gsub!("0", "false")
  truth_result.gsub!("1", "true")

  puts(hash.values.join(" | ") + " | " + eval(truth_result).to_s)
end

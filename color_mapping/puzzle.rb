a = 50
b = 100
c = 75

r1 = 200
g1 = 0
b1 = 0

r2 = 100
g2 = 0
b2 = 0

r3 = 


percent = (c - a) / (b - a) # .5

((r1 - r2) * percent) + r2 = 150


temp_mapping = {
  "#5B6EE1": 5,  # Icy blue   -- Very cold!:ice_cube:
  "#639BFF": 32, # Light Blue -- Freezing  :cold_face:
  "#99E550": 64, # Green      -- Perfect!  :relieved:
  "#FBF236": 78, # Yellow     -- Warm      :sun_with_face:
  "#AC3232": 96, # Red        -- Hot       :hot_face:
}


input = 73

expected_result = 64, 78

def find_values(input)
  small_value
  large_value

  temp_mapping.sort(based on value).each_with_index do |(k,v), i|
    next if input > v

    large_value = temp_mapping[i]
    small_value = temp_mapping[i - 1]
  end
end

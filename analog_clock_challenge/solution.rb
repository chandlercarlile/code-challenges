current_hour = ::Time.now.hour
current_hour -= 12 if current_hour > 11

current_minute = ::Time.now.min

minute_increment = 360/60.0
current_minute_increment = current_minute * minute_increment

hour_increment = 360/12.0
hour_minute_increment = hour_increment/60.0
current_hour_increment = (hour_increment * current_hour) + (hour_minute_increment * current_minute)

angle = (current_hour_increment - current_minute_increment).abs
other_angle = 360 - angle

puts "Angle from minute hand to hour hand, clockwise: #{angle}"
puts "Angle from hour hand to minute hand, clockwise: #{other_angle}"

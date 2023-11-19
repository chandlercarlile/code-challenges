current_time = ::Time.now.strftime("%H:%M")

current_hour = current_time.split(":").first.to_f
current_minute = current_time.split(":").last.to_f

current_hour = 0 if current_hour == 12

minute_increment = 360/60.0
current_minute_increment = current_minute * minute_increment

hour_increment = 360/12.0
hour_minute_increment = hour_increment/60.0
current_hour_increment = (hour_increment * current_hour) + (hour_minute_increment * current_minute)

angle = current_hour_increment - current_minute_increment
angle = angle * -1 if angle.negative?()

puts angle

# always give the smaller angle - is that what we want?
# angle = 360 - angle if angle > 180

# puts angle

other_angle = 360 - angle
puts other_angle

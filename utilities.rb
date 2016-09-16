def leap_year?(year)
	multiple?(year, 100) ? multiple?(year, 400) : multiple?(year, 4)
end

def multiple?(year, divisor)
	year % divisor == 0
end

def percent_year_in_seconds(seconds)
	format_as_percentage((seconds / SECONDS_IN_YEAR) * 100)
end

SECONDS_IN_YEAR = 1.0 * 60 * 60 * 24 * 365

def format_as_percentage(number)
	'%.1f' % number + '%'
end

def convert_military_to_standard(time_in_standard)
	hour, minute_and_am_or_pm = time_in_standard.split(":")
	minute, am_or_pm = minute_and_am_or_pm.split(" ")
	am_or_pm.downcase != 'am' ? am_converter(hour, minute) : pm_converter(hour, minute)
end

def am_converter(hour, minute)
	hour.to_i == 12 ? time_in_military = hour + ":" + minute : time_in_military = (hour.to_i + 12).to_s + ":" + minute
	return time_in_military
end

def pm_converter(hour, minute)
	hour.to_i == 12 ? time_in_military = (hour.to_i - 12).to_s + ":" + minute : time_in_military = hour + ":" + minute
	return time_in_military
end

def convert_standard_to_military(time_in_military)
	hour, minute = time_in_military.split(":")
	hour.to_i < 12 ? hour + ":" + minute + " am" : (hour.to_i - 12).to_s + ":" + minute + " pm"
end

def okay(a, b)
	c = false
	if (a.split(":")[0].to_i >= 8 && b || a.split(":")[0].to_i >= 10 && !b) && a.split(":")[1].split(" ")[1] == 'pm'
		c = false
	else
		c = true
	end
	return c
end

def span(a, b)
	c = 0
	d = 0
	if a < b
		c = b
		d = a
	else
		c = a
		d = b
	end

	return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
end

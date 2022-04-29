
# DON'T CHANGE THIS CODE
# ----------------------
require "net/http"
require "json"
url = "https://weatherdbi.herokuapp.com/data/weather/chicago"
uri = URI(url)
response = Net::HTTP.get(uri)
weather_data = JSON.parse(response)
# ----------------------

# EXERCISE
# Using the Ruby hash `weather_data` that includes weather forecast data for Chicago,
# write a weather summary out to the screen including the current conditions and upcoming forecast.
# Something like the output below.

# Sample output:
# In Chicago, IL it is currently 67 degrees and cloudy.
# The rest of today will be a high of 65 and scattered shows.
# The upcomming weather forecast is:
# Wednesday: a high of 65 and scattered showers.
# Thursday: a high of 67 and partly cloudy.
# Friday: a high of 59 and rain.
# Saturday: a high of 77 and cloudy.
# ...

# STEPS
# Look at the weather_data hash.
#puts weather_data


# Find the current data.
current_city = weather_data["region"]
current_temperature = weather_data["currentConditions"]["temp"]["f"]
current_conditions = weather_data["currentConditions"]["comment"]

# Build a string with the text and dynamic data from the hash.
# "In #{...} it is currently #{...} degrees and #{...}"
current_weather = "In #{current_city} it is currently #{current_temperature} degrees and #{current_conditions}"
puts current_weather

# Find the array of forecast data.
forecast_data = weather_data["next_days"]
#puts forecast_data
# Read only the first element of that array to display the conditions for the rest of today.
today_high = forecast_data[0]["max_temp"]["f"]
today_conditions = forecast_data[0]["comment"]
rest_of_day_weather = "The rest of today will be a high of #{today_high} and #{today_conditions}."
puts rest_of_day_weather
# Use a loop to display the daily summary for the upcoming forecast.
puts "The upcomming weather forecast is:"
for forecast in forecast_data
    forecast_day = forecast["day"]
    forecast_high = forecast["max_temp"]["f"]
    forecast_conditions = forecast["comment"]
   puts "#{forecast_day}: a high of #{forecast_high} and #{forecast_conditions}"
end



# CHALLENGE
# Can you display the weather forecast summary for a user-entered city?
# Use the following code at the very top of the file and then replace "chicago" in the api url with the user-entered city:
# puts "What city are you in?"
# city = gets.chomp
# puts city
# Note: what happens if the user-entered value is not a known city? You'll want to do some error handling.

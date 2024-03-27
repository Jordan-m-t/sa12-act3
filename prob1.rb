require 'httparty'

def fetch_weather_data(city)
    api_key = '4a75a23eb7d38836251cb182cd044c23'
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}"
    response = HTTParty.get(url)
  
    if response.success?
        weather_data = response.parsed_response
        temperature_fahrenheit = (weather_data['main']['temp'] - 273.15) * 9/5 + 32
        humidity = weather_data['main']['humidity']
        conditions = weather_data['weather'].first['description']
        puts "Current weather in #{city}:"
        puts "Temperature: #{temperature_fahrenheit.round(2)}°F, Humidity: #{humidity}%, Conditions: #{conditions}"
    else
        puts "Failed to fetch weather data for #{city}."
    end
end

fetch_weather_data('London')
fetch_weather_data('Denver')
fetch_weather_data('Memphis')

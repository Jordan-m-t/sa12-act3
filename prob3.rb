require 'httparty'

def fetch_events(city)
    api_key = 'tDwWZt7bqks8301EIhNm26PY3P7phAuy'
    url = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&city=#{city}&apikey=#{api_key}"
    response = HTTParty.get(url)
    
    if response.success? && response.parsed_response['_embedded']
        events = response.parsed_response['_embedded']['events']
        puts "Upcoming events in #{city}:"
        events.each_with_index do |event, index|
            event_name = event['name']
            event_venue = event['_embedded']['venues'][0]['name'] rescue 'Unknown venue' # Using 'rescue' to handle missing data
            event_date = event['dates']['start']['localDate'] rescue 'Unknown date' 
            puts "#{index + 1}. #{event_name} - Venue: #{event_venue} - Date: #{event_date}"
        end
    else
        puts "Failed to fetch events for #{city}."
    end
end

fetch_events('Memphis')

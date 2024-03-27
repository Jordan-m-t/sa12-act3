require 'httparty'

def convert_currency(amount, from_currency, to_currency)
  api_key = '714ab86c35ab0b19fb871637'
  url = "https://api.exchangerate-api.com/v4/latest/#{from_currency}"
  response = HTTParty.get(url)
  
  if response.success?
    rates = response.parsed_response['rates']
    exchange_rate = rates[to_currency]
    converted_amount = amount * exchange_rate
    puts "#{amount} #{from_currency} is #{converted_amount.round(2)} #{to_currency} at a rate of #{exchange_rate}."
  else
    puts "Failed to fetch exchange rates."
  end
end

convert_currency(100, 'USD', 'EUR')
convert_currency(100, 'USD', 'KRW')

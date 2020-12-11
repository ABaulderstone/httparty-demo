require 'httparty'

# response = HTTParty.get('https://icanhazdadjoke.com', {headers: {accept: "application/json"}})
# puts "Status: #{response.code}"
# joke_hash = JSON.parse(response.body)
# puts joke_hash["joke"]

puts "Which pokemon?"
name = gets.chomp.downcase
def get_pokemon(name)
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{name}")
    if response.code == 404
        puts "No such pokemon"
        return 
    end
    
    pokemon_hash = JSON.parse(response.body)
    puts "#{pokemon_hash["name"]} likes to use #{pokemon_hash["abilities"][0]["ability"]["name"]}" 
end

get_pokemon(name)
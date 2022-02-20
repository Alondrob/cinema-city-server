# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'uri'
require 'net/http'
require 'openssl'
puts  "apple"
MovieActor.delete_all
Actor.delete_all
Movie.delete_all
puts "cherry"

(1970..2022).to_a.each do |year|
    page_number = 1
    loop do
        puts "year: #{year}, page_number: #{page_number}"
        url = URI("https://data-imdb1.p.rapidapi.com/movie/byYear/#{year}/?page_size=100#{'&page=' + page_number.to_s if page_number > 1}")
        page_number += 1
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'data-imdb1.p.rapidapi.com'
        request["x-rapidapi-key"] = '4f49e44fe5mshb356fb96b2bc15ap109f78jsne88cc1e9d543'

       
        response = http.request(request)

        json = JSON.parse(response.read_body)

        ## json - first iteration gives back arr of objects {imdb_id: tt00..., title: MASH}

        json["results"].each do |movieData|
            #josn["results"] grabs the array and iteration begins
            movie = Movie.new(title: movieData["title"])
            ##creates new obj with id and title by grabing the key "title from each elm in the array"
            
            #why 
            
            url = URI("https://data-imdb1.p.rapidapi.com/movie/id/#{movieData['imdb_id']}/")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-host"] = 'data-imdb1.p.rapidapi.com'
            request["x-rapidapi-key"] = '4f49e44fe5mshb356fb96b2bc15ap109f78jsne88cc1e9d543'

            response = http.request(request)
            
            movie_json = JSON.parse(response.read_body)
        
            movie.image = movie_json["results"]["image_url"]
            movie.plot = movie_json["results"]["plot"]
            movie.year = movie_json["results"]["year"]
            movie.rating = movie_json["results"]["rating"]
            movie.movie_length = movie_json["results"]["movie_length"]

            url = URI("https://data-imdb1.p.rapidapi.com/movie/id/#{movieData['imdb_id']}/cast/")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-host"] = 'data-imdb1.p.rapidapi.com'
            request["x-rapidapi-key"] = '4f49e44fe5mshb356fb96b2bc15ap109f78jsne88cc1e9d543'

            response = http.request(request)
            json_actors = JSON.parse(response.read_body)
            
            
            movie.director = json_actors["results"]["roles"].find { |role_json| role_json["role"] == "Director" }["actor"]["name"] rescue nil

            filtered_writers =  json_actors["results"]["roles"].map {
                |var|
                if(var["role"] == "Writer")
                    var["actor"]["name"]
                end
            } rescue []
            movie.writers = filtered_writers.uniq.compact.join(', ')
            
            movie.save
            puts "movie saved with id #{movie.id} and name #{movie.title}"

            filtered_actors = json_actors["results"]["roles"].select {
                |val| ["Writer", "Director"].exclude?(val["role"])
            } rescue []
            filtered_actors.each  do |val| 
            actor = Actor.find_or_create_by(name: val["actor"]["name"],imdb_id: val["actor"]["imdb_id"])
            movie_actor = MovieActor.create(role: val["role"], actor_id: actor.id, movie_id: movie.id )
            end
            
            
        end
        unless json["next"]
            break
        end
    end
end


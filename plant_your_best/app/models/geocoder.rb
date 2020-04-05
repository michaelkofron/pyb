#returns object of coords and the state name of inputss

class Geocoder 

    def initialize(parameter)
        @location = parameter
    end

    def get_info
        geocode_link = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@location}&key=#{Key.key}"

        current_page = Nokogiri::HTML(open(geocode_link))

        json = JSON.parse(current_page.text)

        if (@location.include? "+") || @location.to_i == 0

            array = []
            json["results"][0]["address_components"].each do |x|
                array << x["long_name"]
            end
            puts array
        else
            puts "bad one"
            array = [json["results"][0]["address_components"][2]["long_name"]]
            puts array
        end

        array.each do |x|
            if State.find_by(name: x)
                @variable = x
            end
        end

        object = [json["results"][0]["geometry"]["location"], @variable]
    end

    

end
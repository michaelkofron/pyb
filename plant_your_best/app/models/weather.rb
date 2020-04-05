class Weather 

    def initialize(geocode_info)
        @coordinates = geocode_info[0]
    end

    def get_weather
        lat = @coordinates["lat"]
        lng = @coordinates["lng"]

        weather_link = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=imperial&appid=#{Key.weatherkey}"

        page = Nokogiri::HTML(open(weather_link))

        json = JSON.parse(page.text)

        return json

    end
end
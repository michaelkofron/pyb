require 'json'
require 'open-uri'
require 'nokogiri'

state_array = ["Alabama", "Alaska", "Arkansas", "Arizona", "California", 
"Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", 
"Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
"Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", 
"Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", 
"New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", 
"Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", 
"Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

state_array.each do |state|
    state_name = state

    new_state = State.create(name: state_name)

    if state.include? " "
        no_space_name = state.gsub(" ", "")
    else
        no_space_name = state
    end

    document = Nokogiri::HTML(open("http://localhost:8080/#{no_space_name}/#{no_space_name}.json"))

    json = JSON.parse(document)

    counter = 1

    json.length.times do 
        common_name = json["#{counter}"]["National Common Name"]
        scientific_name = json["#{counter}"]["Scientific Name with Author"]
        family_name = json["#{counter}"]["Family"]

        new_plant = Plant.create(com_name: common_name, sci_name: scientific_name, fam_name: family_name)

        new_state.plants << new_plant

        puts new_plant.com_name + " " + state

        counter += 1

    end

end
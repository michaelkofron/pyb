class StatesController < ApplicationController
    def all
        states = State.all

        array = states.map{|state| {id: state.id, name: state.name, number_of_plants: state.plant_number, link: "https://www.plantyour.best/api/states/#{state.name.gsub(" ", "+")}/plants"}}

        render json: {states: array}

    end

    def state
        #state_name = params[:state_name].capitalize

        place = Geocoder.new(params[:place])

        info = place.get_info

        state_name = info[1]

        dbState = State.find_by(name: state_name)

        plants = dbState.plants

        if params[:query] == nil
            plants = plants.limit(100)
            results = plants.select("max(id) as id", "com_name", "sci_name", "fam_name", "wiki").group(:sci_name)
            results_array = results.map{|plant| {id: plant.id, com_name: plant.com_name, sci_name: plant.sci_name, fam_name: plant.fam_name, wikipedia: plant.wiki, prevalence: (plant.states.map{|x| x.name}).uniq}}
            render json: {results: results.length, plants: results_array}
        else
            render json: helpers.plant_query(plants)
        end

    end
end
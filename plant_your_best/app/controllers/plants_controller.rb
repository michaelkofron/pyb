class PlantsController < ApplicationController
    def info
        plants = Plant.all

        render json: {unique_plants_count: plants.length, plant_entries_across_states: 253659}

    end
    def all
        plants = Plant.all

        
        render json: helpers.plant_query(plants)

    end
end
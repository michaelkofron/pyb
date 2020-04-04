class StatesController < ApplicationController
    def all
        states = State.all

        array = states.map{|state| {id: state.id, name: state.name, number_of_plants: state.plant_number}}



        render json: {states: array}

    end
end
class PlantsController < ApplicationController
    def info


    end
    def all
        plants = Plant.all

        #split query parameters and flatten into useable array
        if params[:query]
            query = params[:query]
            raw_query_array = query.split("&")
            to_be_flattened_query_array = raw_query_array.map{|x| x.split("=")}
            flattened_query_array = to_be_flattened_query_array.flatten
        end

        #use flattened array, go through each value and add scope methods
        flattened_query_array.each_with_index do |value, index|
            case value
            when "com_name"
                plants = plants.by_com_name(flattened_query_array[index + 1].gsub("+", " "), params[:searchtype])
            when "sci_name"
                plants = plants.by_sci_name(flattened_query_array[index + 1].gsub("+", " "), params[:searchtype])
            when "fam_name"
                plants = plants.by_fam_name(flattened_query_array[index + 1], params[:searchtype])
            when "page_size"
                plants = plants.limit(flattened_query_array[index + 1])
            end
        end

        #renders only plants that have a unique 
        render json: plants.select("max(id) as id", "com_name", "sci_name", "fam_name").group(:sci_name)
    end
end
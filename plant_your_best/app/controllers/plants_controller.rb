class PlantsController < ApplicationController
    def info
        render "info"

    end
    def all
        plants = Plant.all

        type = params[:searchtype] == "strict" ? "strict" : "loose"

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
                plants = plants.by_com_name(flattened_query_array[index + 1].gsub("+", " "), type)
            when "sci_name"
                plants = plants.by_sci_name(flattened_query_array[index + 1].gsub("+", " "), type)
            when "fam_name"
                plants = plants.by_fam_name(flattened_query_array[index + 1], type)
            when "page_size"
                plants = plants.limit(flattened_query_array[index + 1])
            end
        end

        results = plants.select("max(id) as id", "com_name", "sci_name", "fam_name").group(:sci_name)

        #renders only plants that have a unique 
        render json: {results: results.length, search_type: type, plants: results}
    end
end
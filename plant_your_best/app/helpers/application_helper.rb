module ApplicationHelper
    def plant_query(plant_start)
        values = ["com_name", "id", "sci_name", "fam_name", "amount"]
        plants = plant_start
        query = params[:query]
        raw_query_array = query.split("&")
        to_be_flattened_query_array = raw_query_array.map{|x| x.split("=")}
        flattened_query_array = to_be_flattened_query_array.flatten

        if !flattened_query_array.to_set.intersect?(values.to_set)
            puts "ASDASDLKASKJLDJLKASJKDLLJASDJLKKJLAS"
            plants = []
            return {results: 0, search_type: "bad-search", plants: []}
        end

        type = params[:searchtype] == "strict" ? "strict" : "loose"

        flattened_query_array.each_with_index do |value, index|
            case value
            when "id"
                plants = plants.by_id(flattened_query_array[index + 1])
            when "com_name"
                plants = plants.by_com_name(flattened_query_array[index + 1].gsub("+", " "), type)
            when "sci_name"
                plants = plants.by_sci_name(flattened_query_array[index + 1].gsub("+", " "), type)
            when "fam_name"
                plants = plants.by_fam_name(flattened_query_array[index + 1], type)
            when "amount"
                plants = plants.limit(flattened_query_array[index + 1])
            end
        end

        if !flattened_query_array.include?("amount")
            plants = plants.limit(100)
        end
       
        results = plants.select('distinct on (sci_name) *')

        results_array = results.map{|plant| {id: plant.id, com_name: plant.com_name, sci_name: plant.sci_name, fam_name: plant.fam_name, wikipedia: plant.wiki, prevalence: (plant.states.map{|x| x.name}).uniq}}
    
        #renders only plants that have a unique 
        return {results: results.length, search_type: type, plants: results_array}
    end
end
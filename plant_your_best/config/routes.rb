Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "application#home"
  get "/api/plants", to: "plants#info" 
  get "/api/plants/:query(/:searchtype)", to: "plants#all"
  get "/api/states", to: "states#all"
  get "/api/states/:place/plants(/:query(/:searchtype))", to: "states#state"
  
  #get "/api/states", to: "states#info"

end

function searchPlantListener(){
    let plant = document.getElementById("search-plant")
    let state = document.getElementById("search-state")
    let search = document.getElementById("searchbar")
    let input = search.children[1]
    plant.addEventListener("click", function(){
        plant.style.display = "none"
        state.style.display = "none"
        search.style.display = "flex"
        input.setAttribute("id", "plant-searchbar")
        input.setAttribute("placeholder", "#name, sci name, family name")
        input.focus()
    })

    state.addEventListener("click", function(){
        plant.style.display = "none"
        state.style.display = "none"
        search.style.display = "flex"
        input.setAttribute("id", "state-searchbar")
        input.setAttribute("placeholder", "#state name, zip code, address")
        input.focus()
    })
}

function exitSearchBar(){
    let exitButton = document.getElementById("exit")
    let plant = document.getElementById("search-plant")
    let state = document.getElementById("search-state")
    let search = document.getElementById("searchbar")
    let input = search.children[1]

    exitButton.addEventListener("click", function(){
        search.style.display = "none"
        plant.style.display = "flex"
        state.style.display = "flex"
        input.removeAttribute("id")
        input.removeAttribute("placeholder")
    })
}

searchPlantListener()
exitSearchBar()
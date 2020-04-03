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
        input.setAttribute("placeholder", "#common-name loose search")
        input.focus()
        searchButtonClick()
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

function searchButtonClick(){
    searchButton = document.getElementById("searchbutton")
    plantSearch = document.getElementById("plant-searchbar")
    stateSearch = document.getElementById("state-searchbar")

    searchButton.addEventListener("click", function(){
        if (plantSearch) {
            window.location.href = `http://localhost:3000/api/plants/com_name=${plantSearch.value}`
        }
    })
}

searchPlantListener()
exitSearchBar()
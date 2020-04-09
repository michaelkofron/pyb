function searchPlantListener(){
    let searchButton = document.getElementById("searchbutton")
    let plant = document.getElementById("search-plant")
    let state = document.getElementById("search-state")
    let search = document.getElementById("searchbar")
    let input = search.children[1]
    plant.addEventListener("click", function(){
        plant.style.display = "none"
        state.style.display = "none"
        search.style.display = "flex"
        input.setAttribute("onkeypress", "return keyPress(event, 'searchicon')")
        searchButton.setAttribute("id", "searchbutton")
        input.setAttribute("id", "plant-searchbar")
        input.setAttribute("placeholder", "#common-name loose search")
        input.focus()
        searchClick()
    })

    state.addEventListener("click", function(){
        plant.style.display = "none"
        state.style.display = "none"
        search.style.display = "flex"
        input.setAttribute("onkeypress", "return keyPress(event, 'searchicon')")
        searchButton.setAttribute("id", "searchbuttonstate")
        input.setAttribute("id", "state-searchbar")
        input.setAttribute("placeholder", "#state name, zip code, address")
        input.focus()
        searchClick()
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
        input.value = ""
        input.removeAttribute("id")
        input.removeAttribute("placeholder")
    })
}

function searchClick(){
    let searchIcon = document.getElementById("searchicon")
    let plantSearch = document.getElementById("plant-searchbar")
    let stateSearch = document.getElementById("state-searchbar")

    searchIcon.addEventListener("click", function(){
        if (searchIcon.parentElement.id == "searchbutton" && plantSearch.value != ""){
            if (plantSearch.value.includes(" ")){
                window.location.href = `${window.location.href}api/plants/com_name=${plantSearch.value.replace(/\s/g, "+")}`
            } else {
                window.location.href = `${window.location.href}api/plants/com_name=${plantSearch.value}`
            }
            plantSearch.value = ""
        } else if (searchIcon.parentElement.id == "searchbuttonstate") {
            if (stateSearch.value.includes(" ")){
                window.location.href = `${window.location.href}api/states/${stateSearch.value.replace(/\s/g, "+")}/plants/`
            } else {
                window.location.href = `${window.location.href}api/states/${stateSearch.value}/plants/`
            }
            stateSearch.value = ""
        }
    })
}

searchPlantListener()
exitSearchBar()
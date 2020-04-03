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
    let plantSearch = document.getElementById("plant-searchbar")
    let stateSearch = document.getElementById("state-searchbar")
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

function searchButtonClick(){
    let searchButton = document.getElementById("searchbutton")
    let plantSearch = document.getElementById("plant-searchbar")
    let stateSearch = document.getElementById("state-searchbar")
    let search = document.getElementById("searchbar")
    let input = search.children[1]

    searchButton.addEventListener("click", function(){
        if (input.placeholder == "#common-name loose search" && input.value != "") {
            window.location.href = `http://localhost:3000/api/plants/com_name=${input.value}`
            input.value = ""
            console.log("click")
        } else if (input.placeholder == "#state name, zip code, address" && input.value != "") {
            console.log('search state')
        } else {
            console.log("blank input")
        }
    })
}

searchPlantListener()
exitSearchBar()
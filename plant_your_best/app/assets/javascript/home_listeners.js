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
        input.setAttribute("onkeypress", "return keyPress(event, 'searchbutton')")
        searchButton.setAttribute("id", "searchbutton")
        input.setAttribute("id", "plant-searchbar")
        input.setAttribute("placeholder", "#common-name loose search")
        input.focus()
        searchButtonClick()
    })

    state.addEventListener("click", function(){
        plant.style.display = "none"
        state.style.display = "none"
        search.style.display = "flex"
        input.setAttribute("onkeypress", "return keyPress(event, 'searchbuttonstate')")
        searchButton.setAttribute("id", "searchbuttonstate")
        input.setAttribute("id", "state-searchbar")
        input.setAttribute("placeholder", "#state name, zip code, address")
        input.focus()
        searchButtonClick()
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
    let searchButtonState = document.getElementById("searchbuttonstate")
    let plantSearch = document.getElementById("plant-searchbar")
    let stateSearch = document.getElementById("state-searchbar")
    let search = document.getElementById("searchbar")
    let input = search.children[1]

    if (searchButton){
        searchButton.addEventListener("click", function(){
            if (input.value != "") {
                if (input.value.includes(" ")){
                    window.location.href = `${window.location.href}api/plants/com_name=${input.value.replace(/\s/g, "+")}`
                } else {
                    window.location.href = `${window.location.href}api/plants/com_name=${input.value}`
                }
                input.value = ""
                console.log("click")
            } else {
                console.log("blank input")
            }
        })
    } else {
        searchButtonState.addEventListener("click", function(){
            if (input.value != "") {
                if (input.value.includes(" ")){
                    window.location.href = `${window.location.href}api/states/${input.value.replace(/\s/g, "+")}/plants/`
                } else {
                    window.location.href = `${window.location.href}api/states/${input.value}/plants/`
                }
                input.value = ""
                console.log("click")
            } else {
                console.log("blank input")
            }
        })
    }
}

searchPlantListener()
exitSearchBar()
# Plant Your Best - A Common-name Plants API

PY.B API features a simple front-end that provides a quick way to interact with the database. From the homepage users can query plants by common-name or query states by state name, zip code, and address. Further parameters and filters can be applied in the traditional way ([see: Documentation](#Documentation)). All results are returned as JSON. Plant information was seeded into the database from the USDA's "State PLANTS Checklist"

![](images/pybfinal.gif)

# Documentation

Because all plants are related to the states that they are present in, users can query by "plant" or "state". 

**A state's plants can be found like this:**

`https://www.plantyour.best/api/states/{STATE_NAME, ZIP_CODE, or ADDRESS}/plants/{PARAMETERS}`

NOTICE: querying by state name is a more direct application of the API, and is overall less error-prone than searching by zip code or address.

**Plants can be found like this:**

`https://www.plantyour.best/api/plants/{PARAMETERS}`

**All plants have a common name, scientific name, family name, wikipedia link, and prevalance (names of states where the plant can be found)**

**All queries default to "loose-search" meaning the API will return as many results as possible within the specified parameters. Search type can be changed to "strict-search" by adding `/strict` to the end of any query:**

`https://www.plantyour.best/api/plants/com_name=peach` will return plants such as "peachleaf bellflower"

`https://www.plantyour.best/api/plants/com_name=peach/strict` will return plants named "peach"

**To query plants with spaces in their names, or states with spaces in their names, use "+" to replace the spaces:**

`https://www.plantyour.best/api/plants/com_name="sweet+orange"`

- **All Parameters**
   * **id** = integer, plant id
   * **com_name** = string, plant common name
   * **sci_name** = string, plant scientific name
   * **fam_name** = string, plant family name
   * **amount** = integer, amount of plants per page (if not specified, defaults to 100)

**Parameters can be stacked using "&"**

`https://www.plantyour.best/api/states/California/plants/com_name=orange&amount=15`

# Built Using

* [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/start)
* [USDA State PLANTS Checklist](https://plants.usda.gov/dl_state.html)
   
  
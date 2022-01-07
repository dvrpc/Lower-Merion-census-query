# Lower Merion census query

This project is a simple query example for our partners at Lower Merion.

## Getting the Code and Software

1. Clone the repository. 
2. Download and install R from https://www.r-project.org/
3. Download and install R Studio from https://www.rstudio.com/products/rstudio/#Desktop

More info on setting up and installing R can be found here
- [Getting set up with R](./topics/setup.md)
- [Using `tidycensus`](./topics/tidycensus.md)

## Installing Package Dependencies 

The R script has the following dependencies: 

plyr; here; sf; summarytools; purrr; tidycensus; tidyverse; tigris; dplyr; descr

If you have not previously installed the dependencies, you will need to do so. If you try to run the script without installing the packages, you will get an error message like 
`Error in library (name_of_package) : there is no package called 'name_of_package'`.

Install each package from R Studio's console (typically at the bottom of the screen in R Studio) with the command  `install.packages('name_of_package')` (include the quotation marks). 

## Updating the Script for a New 5-Year Dataset

If you are running the code against a newly released 5-year ACS dataset, do the following:

1. Make a copy of the latest .R file (e.g. script-2019.R) and rename it for the year you are working on. (This is to ensure that any schema changes for a particular 5-year dataset are kept with the code for that set.)
2. Adjust the value for the `c_year` variable (to be the end year of the dataset).
3. Verify the field names (listed under the `# Fields` section). Follow the link provided to check the schema for that dataset.

## Running the Code

1. Open RStudio. 
2. Open the R file (File -> Open File)
3. Edit line 8 to reflect your working directory ie. "C:\\Users\\jdobkin\\Documents"
4. Edit line 13 to include your census api key
5. edit line 16 to relfect which year and survey you want to view variables from
6. view your avaiable variables by running line 17 and oepning census_variables.csv document
7. include your variables in line 22 in the same format shown in the code
8. Run the code by clicking the Source button or Ctrl+A followed by Ctrl+Enter. 
9. You can change which geo level is being queried in the `get_acs(geography = "")` argument. Available geographies are shown in the `tidyCensus` basic documentation [here](https://walker-data.com/tidycensus/articles/basic-usage.html)
 
If you see an error about packages not being installed, see [Installing Package Dependencies](#installing-package-dependencies) above. 

Please provide your own API Key (this is required for the `tidycensus` package, not the Census API), you may get another one [here](https://api.census.gov/data/key_signup.html).

### Outputs 

After the code has finished, outputs are saved in the /outputs subdirectory of where you cloned the repository on your local machine, including:
- tracts.shp is a .shp file of the tract level data you queried
- tracts.csv is a .csv file of the tract level data your queried
- block_group.shp is a .shp file of the block group level data you queried
- block_group.csv is a .csv file of the block group level data you queried

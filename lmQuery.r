#lower merion query

# Load libraries
library(plyr); library(here); library(sf); library(summarytools); library(purrr);
library(tidycensus); library(tidyverse); library(tigris); library(dplyr); library(descr)


wd <- "C:\\Users\\jdobkin\\Documents"
setwd(wd)
path_out = wd

#set and install api key
api_key <-"add your api key here"

#set output name
output_Name <- 'lm_Output.csv'

#select your variables from this list
censusVaris <- load_variables(2019, "acs5") 
write.csv(censusVaris,paste0(path_out, "census_variables.csv"),row.names = FALSE)


#add the variables you selected to this list
c_year <- (2019)
vari = c(ethnic_minority_universe             <- "B03002_001",
         ethnic_minority_count                <- "B03002_012")

#geographies (set for montco)
county_list <- c("Montgomery County, Pennsylvania")
states <- c("PA")
lm_geo <- c(4209144976)

tract_list <- c("42091204600",
                "42091204701",
                "42091204500",
                "42091205100",
                "42091204400",
                "42091204300",
                "42091205200",
                "42091204702",
                "42091205000",
                "42091205502",
                "42091205503",
                "42091205501",
                "42091205300",
                "42091204900",
                "42091205400",
                "42091204800"
)

#api calls and filters
tracts = get_acs(geography = "tract",
               variables = vari,
               year = c_year,
               output = "wide",
               state = states,
               geometry = TRUE,
               survey = "acs5"
)

tracts <- tracts %>% 
  filter(GEOID %in% tract_list) 

block_group <- get_acs(geography = "block group",
                       variables = vari,
                       year = c_year,
                       output = "wide",
                       state = "PA",
                       geometry = TRUE)
block_group <- block_group %>% filter(grepl("^42091204600 |^42091204701 |^42091204500|^42091205100|^42091204400|^42091204300|^42091205200|^42091204702|^42091205000|^42091205502|^42091205503|^42091205501|^42091205300|^42091204900|^42091205400|^42091204800", GEOID))

#exporting
Layer_opt<-c("RESIZE=yes")
st_write(tracts,paste0(getwd(), "/", "tracts2.shp"),layer_options = Layer_opt)
write.csv(tracts, paste0(getwd(), "/", "tracts.csv"))
st_write(block_group,paste0(getwd(), "/", "block_group.shp"),layer_options = Layer_opt)
write.csv(block_group, paste0(getwd(), "/", "block_group.csv"))
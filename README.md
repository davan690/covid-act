## COVID-19 Dashboard for Canberra
**Rapid science for a rapidly changing world: local covid19 modelling for national trends.**

Team Members:

 * Anthony Davidson
 * Bernd
 * Luis 

### Overview

> EXAMPLE: This particular dashboard aims to provide the Ontario public with an understanding of the current case progression and testing status within Ontario, as well as the vaccination status of Ontario compared to other Canadian provinces and territories. The Ontario public can use this dashboard to determine how effectively current public health measures are in reducing virus spread, as well as to ascertain the safety level of their local communities. The first page of the dashboard provides information on case-related statistics (e.g. total case and death counts, average daily testing volumes, percent positivity rate, and outbreak frequencies) for different PHUs within Ontario. The second page of the dashboard contains visualizations that compare the vaccine distribution and administration of Ontario to other provinces and territories. This may help the public determine how soon they will be vaccinated. The dashboard was created with flexdashboard in R.

Current outbreak information for Canberra, ACT: Many visualization tools have been built since the start of the COVID-19 pandemic (cite). In Australia, there are a collection of tools that have curated the online data as the goverment passes on Health and enforment measure. 



WORKFLOW:

Sections of information:

`function1`

etc etc ....





## Dashboard Summary

The goal of the dashboard is to create a up-to-date information on COVID-19 case locations, timing and contact level in Canberra, Australia. I have generated the additional documentation (vignettes and website) because I have found this application applies many of the tricks and tips I have come across since working with RMarkdown and R. 

[DETAILS COMING SOON]

To do this the simple flexdashboard is run using a collection of functions that use the relationships between arrays, matrices and vectors in R. A collection of R code for accessing and working with the public github projects available for supporting community responses to covid-19 outbreaks. The overall output is inspired by the "Indiana COVID-19 Website", Queensland and Ontiro open-science projects and the open source code they have published. A example of reproducible research in action. 

## Run the dashboard

#### Online

There are two locations where the information and resources are avaliable:

1. github webpage here:
2. shinyapps.io page



##### Locally viewing and running project

Coming,,,DEMO ONLY BELOW: Coming,,,DEMO ONLY BELOW

- Please ensure that [Firefox browser](https://www.mozilla.org/en-CA/firefox/new/) is installed. This is because the map of Canada on Page 2 of the dashboard uses a Firefox webdriver to scrape vaccine data. Unfortunately the webdriver would not work for any other web browser.
- Please view the dashboard in **full screen** for optimal display.

Step 1. Clone the repo. If needed, instructions can be found [here](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/cloning-a-repository).

Step 2. Install the package versions and R version specified in `requirements.txt`.

```
R version 4.0.2           
flexdashboard 0.5.2
dplyr 1.0.4
knitr 1.31
tidyverse 1.3.0
kableExtra 1.3.4
hpackedbubble 0.1.0
classInt 0.4.3
plotly 4.9.3
crosstalk 1.1.1
leaflet 2.0.4.1
maps 3.3.0
raster 3.4.5
sp 1.4.5
regal 1.5.23 
jsonlite 1.7.2
ggplot2 3.3.3
viridis 0.5.1
hrbrthemes 0.8.0
scales 1.1.1
reshape2 1.4.4
rvest 0.3.6
RCurl 1.98.1.2
RSelenium 1.7.7
```



Step 3. Open `STA-2453_P2.Rmd` in RStudio and knit the file (should take no more than 5 min for dashboard to show up).

### File Directory

Coming,,,DEMO ONLY BELOW

-  `Ministry_of_Health_Public_Health_Unit_Boundary.geojson` - latitude and longitude coordinates used to specify the map outline of PHUs within Ontario to generate Page 1 map.
-  `cases_by_status_and_phu.csv` - time series data that includes number of active cases, resolved cases, and deaths for all PHUs. Used for Page 1 map.
-  `socioeconomic_phu.csv`- dataset of PHU name and their corresponding median after-tax household income in 2015.
-  `clean_socioeconomic_income_by_phu.R` - cleaning script used to generate `socioeconomic_phu.csv` from 2016 Canadian Census dataset.
-  `canada_provinces.geojson`-  latitude and longitude coordinates used to specify the map outline of Canadian provinces/territories to generate Page 2 map.
-  `vaccine_administration_total_prov.csv`and `vaccine_distribution.csv`- Vaccine received by each province/territory, categorized by brand name (Pfizer/BioNTech, Moderna). Used to generate bar chart (not actually used in code, since actual URLs were used to fetch most updated data).
-  `province_populations.csv` - Population by Canadian province/territory scraped from Wikipedia. Used to generate per population bar chart.
-  `vaccine_administration_timeseries_prov_2.csv` -  time series data of cumulative vaccine administration counts for each province/territory.
-  `vaccine_province.csv` and `vaccine_distribution2.csv`- dataset containing various vaccine metrics for each province/territory scraped from CTV News. Used to generate Page 2 map.

### Data Sources

## Similar resources

Covid19 is a global pandemic and the numbers of humans actually working on the problem is massive. Here are a few key resources I have been using to develop my understanding of the tools and approaches available for covid19 modelling on github and more generally in the media etc.

### Australian dashboards

Australia has been leading the world in some aspects of the covid19 response, both at the global and national level. This is also represented in the open and accessible data. Here are a few projects I have worked from:



#### New South Wales

ANU

#### Queensland

Publication:

Reproducible code: https://figshare.com/articles/journal_contribution/Queensland_COVID19_tracker/12957065/4



### International dashboards



#### Ontario Canada

**Page 1: Case status and teting volumes in Ontario**
<img src="../data-science-methods-project2/demo/demo11.gif" alt="Dashboard Page 1 Part 1" style="zoom:15%;" />
![Dashboard Page 1 Part 2](../data-science-methods-project2/demo/demo22.gif)

**Page 2: Vaccination status in Canada**
![Dashboard Page 2](../data-science-methods-project2/demo/demo33.gif)

Ontario GeoHub

 * https://geohub.lio.gov.on.ca/datasets/ministry-of-health-public-health-unit-boundary/geoservice?geometry=-168.377%2C38.920%2C-1.122%2C58.787

  Ontario Data Catalogue

 * https://data.ontario.ca/dataset/status-of-covid-19-cases-in-ontario-by-public-health-unit-phu
 * https://data.ontario.ca/dataset/a2dfa674-a173-45b3-9964-1e3d2130b40f/resource/07bc0e21-26b5-4152-b609-c1958cb7b227/download/testing_metrics_by_phu.csv
 * https://data.ontario.ca/dataset/1115d5fe-dd84-4c69-b5ed-05bf0c0a0ff9/resource/d1bfe1ad-6575-4352-8302-09ca81f7ddfc/download/cases_by_status_and_phu.csv
 * https://data.ontario.ca/dataset/ontario-covid-19-outbreaks-data/resource/36048cc1-3c47-48ff-a49f-8c7840e32cc2

 Statistics Canada:

 * https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/details/download-telecharger/comp/GetFile.cfm?Lang=E&FILETYPE=CSV&GEONO=058

 Canada Public Health Services:

 * https://www.canada.ca/en/public-health/services/diseases/2019-novel-coronavirus-infection/prevention-risks/covid-19-vaccine-treatment/vaccine-rollout.html

 Canada COVID-19 Github Repository:

 * https://raw.githubusercontent.com/ccodwg/Covid19Canada/master/timeseries_prov/vaccine_administration_timeseries_prov.csv

 Government of Canada:

 * https://www.canada.ca/en/public-health/services/diseases/2019-novel-coronavirus-infection/prevention-risks/covid-19-vaccine-treatment/vaccine-rollout.html

 CTV News:

 * https://www.ctvnews.ca/health/coronavirus/coronavirus-vaccine-tracker-how-many-people-in-canada-have-received-shots-1.5247509?fbclid=IwAR3HMQewAhl4fmp8SisM6Pdq-xQN-hG9sa0Q9C1ugzqlNa8UZNGblDHGBcA

 Carto:

 * https://thomson.carto.com/tables/canada_provinces/public/map




##### Indiana COVID-19 Website ![Noon Update](https://github.com/ercbk/Indiana-COVID-19-Website/workflows/Noon%20Update/badge.svg)![Evening Update](https://github.com/ercbk/Indiana-COVID-19-Website/workflows/Evening%20Update/badge.svg)


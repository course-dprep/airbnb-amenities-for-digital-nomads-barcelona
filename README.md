# Shifting Demand for Airbnb Amenities among Digital Nomads

The objective of this project is to examine the Airbnb market of Barcelona, with a focus on identifying amenities that are most important among digital nomads. This project aims to provide insights into how landlords can make their listings more attractive for long-term rentals by for example digital nomals by prioritizing these amenities.

## Research motivation

According to research, the number of people working remotely almost doubled between 2019 and 2021. Moreover, in July 2022, remote work listings accounted for 17% of the total listings on LinkedIn. Although remote workers don't have a fixed place to work, they do need a place to stay and work for a certain period of time (usually for around a month or longer). Airbnb is the biggest platform to find long-term stays and is widely used by these digital nomads. According to Airbnb, their 'Live anywhere on Airbnb' trial program aims to simplify the process of staying in an Airbnb for a longer time. Implementation of this program already accounted for a 22% increase in long-term bookings which are stays of over 28 nights or more.

People that want to stay in an Airbnb for an extended period may be looking for a room with certain amenities. For instance, important amenities include great wifi and some digital nomads say that a seperate bedroom and fully equiped kitchen are important.

This research investigates what other characteristics are important for Digital Nomads and how landlords can make their apartments more attractive for these long-term rentals.

### Research question

In a city such as Barcelona there are many people who want to rent a room for a longer period. The question is how owners can entice these people to rent their apartments. Employees from certain companies who have to work for a couple of weeks in Barcelona might need some extra work space and/or WiFi for example. Therefore, our research questions is:

### Research question

*How can an Airbnb landlord make the apartment more attractive with respect to amenities for long-term rentals?*

## Research method

To address our research question, we investigated the difference between long-term and short-term stays (independent variable) in terms of the different amenities that were present (dependent variable). For the first (linear) regression, we decided that an Airbnb listing was called 'long' if it was booked for a period of 28 days or longer and 'short' if it was booked for less than 28 days. Furthermore, we only took the 100 most popular amenities for this first regression, as the number of amenities was rather large.

[explaining the other regressions & factor analysis ]

### Repository overview

    Team-assignment-team-4-1
    ├── data
    ├── gen
    │   ├── analysis
    │   ├── data-preparation
    │   └── paper
    └── src
        ├── analysis
        │   ├── regression1.R
        │   ├── previsualization.R
        │   └── update_input.R    
        ├── data-preparation
        │   ├── download_data
        │   ├── merge_data
        │   ├── clean_data
        |   ├──
        │   └── update_input.R
        └── paper
        │   ├── paper.tex
        │   ├── paper.rmd
        │   └── tables.R
        └── clean-up.R    
    ├── README.md
    ├── makefile
    ├── team_assignment.Rproj
    └── .gitignore

### Dependencies

Please follow the installation guides on <https://tilburgsciencehub.com> for:

-   R: [installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)

-   Make: [installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)

After installation of both R and Make you can run the code of this project (see running instructions, next paragraph). Before running make sure that you have all packages installed that are listed below:

<div>

    install.packages("tidyverse")
    install.packages("dplyr")
    install.packages("stringr")
    install.packages("tibble")
    install.packages("magrittr")
    install.packages("readr")
    install.packages("lubridate")
    install.packages("stringi")
    install.packages("psych")

</div>

## Running instructions

Before the detailed running instructions, we want to inform you that running the code of this project can take quite some time (around 30 min). To run the code you can follow these instructions:

0.  Optional step: Fork this repository

```{=html}
<!-- -->
```
1.  Open your command line / terminal (preferably in R) and run the following code:

```{=html}
<!-- -->
```
    git clone https://github.com/course-dprep/team-assignment-team-4-1.git

2.  Set your working directory in R to "To Project Directory" under session and run the following command in your R terminal:

```{=html}
<!-- -->
```
    make

This will run the entire code and provide you with an R-markdown document (see: src/paper), which visualizes for what kind of amenities demand increases for long-term listings as opposed to short-term listings.

To clean all the unnecessary data files that were created in this project pipeline, run the following code in the command line / terminal:

    make clean

### Data Availability Statements

[external data listings] [<https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html>]

### Details on each data source

[format, location, dictionary, packagesm references] [summary in table form (name, files, location, provided, citation)]

## References

-   Airbnb. (2021, 27 januari). Digital nomads find the perfect solution to work and live remotely while traveling the globe. Airbnb for Work. <https://www.airbnbforwork.com/resource/digital-nomads-find-the-perfect-solution-to-work-and-live-remotely-while-traveling-the-globe/>

-   Airbnb Guide to Live and Work Anywhere: How Communities Can Benefit from Remote Workers. (2022). In Airbnb. Geraadpleegd op 15 maart 2023, van <https://news.airbnb.com/wp-content/uploads/sites/4/2022/09/Airbnb-Guide-to-Live-and-Work-Anywhere-15-September-2022-1.pdf>

-   Dubois, J., & Dubois, J. (2023, 22 februari). Digital Nomad and Remote Worker Guide to Living in Airbnbs. Deskless Nomad. <https://www.desklessnomad.com/remote-worker-guide-living-airbnbs/#>:\~:text=Airbnb%20is%20a%20great%20way,set%20of%20challenges%20and%20considerations

-   Masson, T. (2022a, februari 16). 2022 Airbnb strategy \| Rental Scale-Up. Rental Scale-Up. <https://www.rentalscaleup.com/2022-airbnb-strategy/>

-   Masson, T. (2022b, september 21). Airbnb's advice and data on how to attract digital nomads to your vacation rentals \| Rental Scale-Up. Rental Scale-Up. <https://www.rentalscaleup.com/airbnbs-advice-and-data-on-how-to-attract-digital-nomads/>

## About

This respository was made by [Lisa Holling](https://github.com/Lisa-Holling) and [Roos van Sambeek](https://github.com/Roosvansambeek) and was commissioned by Hannes Datta, professor at Tilburg University. This project was part of the course 'Data Preparation and Workflow Management' of the MSc Marketing Analytics.

# Demand for specific Airbnb Amenities among Digital Nomads

The objective of this project is to examine the Airbnb market of Barcelona, with a focus on identifying amenities that are most important among digital nomads. The results of this project aim to provide Airbnb landlords with insights into how they can make their apartments more appealing for long-term rentals by digital nomads, by prioritizing specific amenities.

## Research motivation

According to research, the number of people working remotely almost doubled between 2019 and 2021. Moreover, in July 2022, remote work listings accounted for 17% of the total listings on LinkedIn. Although remote workers don't have a fixed place to work, they do need a place to stay and work for a certain period of time (usually for around a month or longer). Airbnb is the biggest platform to find long-term stays and is widely used among digital nomads. According to Airbnb, their 'Live anywhere on Airbnb' trial program aims to simplify the process of staying in an Airbnb for a longer time. Implementation of this program already accounted for a 22% increase in long-term bookings which are stays of over 28 nights or more.

People that want to stay and work in an Airbnb for an extended period, may be looking for a place with specific amenities, which may also differ from normal stays. For instance, digital nomads state to appreciate having a separate bedroom, a fully equipped kitchen, and stable WIFI. This project investigates in more specific which amenities are most important to digital nomads, and thus how landlords can respond to the increasing request for long-term rentals.

### Research question

In a city such as Barcelona there are many people who want to rent a room for a longer period to work from there. The question is how owners can adapt their apartments to this demand for longer stays. Therefore, our research questions is:

*How can an Airbnb landlord make a listing more attractive with respect to amenities for long-term rentals?*

## Research method

To address our research question, we investigated the difference between long and short-term stays (independent variable) in terms of the different amenities that were present (dependent variable). For the first (linear) regression, we decided that an Airbnb listing was called 'long' if it was booked for a period of 28 days or longer and 'short' if it was booked for less than 28 days. Furthermore, we only took the 100 most popular amenities for this first regression, as the number of amenities was rather large.

For the second regression an Airbnb listing was considered 'long' if it was booked for a period longer than 58 days (almost 2 months) and 'short' if it was booked for less than 58 days. By increasing the amount of days, it is more likely that we really capture the needs of digital nomads. This is because the 28 days which defines a 'long' listing in the first linear regression, could also be a longer-vacation. Therefore this second regression was executed to see if the amenities that were significantly more present in long versus short listings would change with the booking time.

### Repository overview

    Team-assignment-team-4-1
    ├── README.md
    ├── makefile
    ├── .gitignore
    ├── install_packages.R
    ├── data
    ├── gen
    │   ├── analysis
    │   └── data-preparation
    └── src
        ├── analysis
        ├── data-preparation
        └── paper

### Dependencies

Please follow the installation guides on <https://tilburgsciencehub.com> for:

-   R: [installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)

-   Make: [installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)

After installation of both R and Make you can run the code of this project (see running instructions, next paragraph). Before running make sure that you have all packages installed that are listed below or run the R script listed in our repository called `install_packages.R`:

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

1.  Open your command line / terminal (preferably in R) and run the following code:

<!-- -->

    git clone https://github.com/course-dprep/team-assignment-team-4-1.git

2.  Set your working directory in R to "To Project Directory" under session and run the following command in your R terminal:

<!-- -->

    make

This will run the entire code and provide you with an R-markdown document (see: src/paper), which visualizes for what kind of amenities demand increases for long-term listings as opposed to short-term listings.

To clean all the unnecessary data files that were created in this project pipeline, run the following code in the command line / terminal:

    make clean

## References

-   Airbnb. (2021, January 27). Digital nomads find the perfect solution to work and live remotely while traveling the globe. Airbnb for Work. <https://www.Airbnbforwork.com/resource/digital-nomads-find-the-perfect-solution-to-work-and-live-remotely-while-traveling-the-globe/>

-   Airbnb Guide to Live and Work Anywhere: How Communities Can Benefit from Remote Workers. (2022). In Airbnb. Retrieved March 15, 2023, from <https://news.Airbnb.com/wp-content/uploads/sites/4/2022/09/Airbnb-Guide-to-Live-and-Work-Anywhere-15-September-2022-1.pdf>

-   Dubois, J., & Dubois, J. (2023, February 22). Digital Nomad and Remote Worker Guide to Living in Airbnbs. Deskless Nomad. https://www.desklessnomad.com/remote-worker-guide-living-Airbnbs

-   Masson, T. (2022a, February 16). 2022 Airbnb strategy \| Rental Scale-Up. Rental Scale-Up. <https://www.rentalscaleup.com/2022-Airbnb-strategy/>

-   Masson, T. (2022b, September 21). Airbnb's advice and data on how to attract digital nomads to your vacation rentals \| Rental Scale-Up. Rental Scale-Up. <https://www.rentalscaleup.com/Airbnbs-advice-and-data-on-how-to-attract-digital-nomads/>

## About

This respository was created by [Lisa Holling](https://github.com/Lisa-Holling) and [Roos van Sambeek](https://github.com/roosvansambeek) and was appointed by Hannes Datta, professor at Tilburg University. This project was part of the course 'Data Preparation and Workflow Management'.

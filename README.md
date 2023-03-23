
# Shifting Demand for Airbnb Amenities among Digital Nomads

The objective of this project is to examine the Airbnb market of
Barcelona, with a focus on identifying the amenities that are most
important among digital nomads. The project aims to provide insights
into how landlords can make their apartments more attractive for
long-term rentals by digital nomals by prioritizing these amenities.

## Research motivation

According to research, the number of people working remotely almost
doubled between 2019 and 2021. Moreover, in July 2022, remote work
listings accounted for 17% of the total listings on LinkedIn. Although
remote workers don't have a fixed place to work, they do need a place to
stay for a certain period of time (usually for around a month or
longer). Airbnb is the biggest platform to find long-term stays and is
widely used by digital nomads. As Airbnb itself says, that they want to
make it easier for guests to live in Airbnb listing with their 'Live
anywhere on Airbnb' trial program. At the end of 2021, long-term stays
of over 28 nights already accounted for 22% of gross nights booked.

People that want to stay in an Airbnb for an extended period may be
looking for a room with certain amenities. For instance, important
characteristics include great wifi and some digital nomads say that a
seperate bedroom and fully equiped kitchen are important to them.

In this research we try to investigate what other characteristics are
important for Digital Nomads and how landlords can make their apartments
more attractive for these long-term rentals.

### Research question

In a city such as Barcelona there are many people who want to rent a
room for a longer period. The question is how owners can entice these
people to rent their apartments. Employees from certain companies who
have to work for a couple of weeks in Barcelona might need some extra
work space and/or WiFi for example. Therefore, our research questions
is:

### Research question

How can an AirBnb landlord make the apartment more attractive with
respect to amenities for long-term rentals?

## Research method

To address our research question, we investigated the difference between
long-term and short-term stays (independent variable) in terms of the
different amenities that were present (dependent variable). For the
first linear regression, we decided that an airbnb listing was called
'long' if it was booked for a period longer than 28 days and 'short' if
it was booked for less than 28 days. Furthermore, we only took the 100
most popular amenities for the first linear regression, as the number of
amenities was rather large.

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
        │   ├── analyze.R
        │   └── update_input.R    
        ├── data-preparation
        │   ├── download_data
        │   ├── merge_data
        │   ├── clean_data
        |   ├──
        │   └── update_input.R
        └── paper
        │   ├── paper.tex
        │   └── tables.R
        └── clean-up.R    
    ├── README.md
    ├── makefile
    ├── team_assignment.Rproj
    └── .gitignore

### dependencies

Please follow the installation guides on <https://tilburgsciencehub.com>
for:

-   R: [installation
    guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)

-   Make: [installation
    guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)

In order to run For R, make sure the following packages are installed
(also done automatically when using the makefile to run this project):

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

[Explain to potential users how to run/replicate your workflow. If
necessary, touch upon the required input data, which secret credentials
are required (and how to obtain them), which software tools are needed
to run the workflow (including links to the installation instructions),
and how to run the workflow.]

To run the code, follow these instructions:

(Option step: Fork this repository)

Open your command line / terminal and run the following code:

```
git clone <https://github.com/%7Byour>
username}/airbnb-price-calculator.git
```

Set your working directory to ...... and run the following command:

    make

This will run the entire code and will provide you with an Rmarkdown
document, which visualizes our When make has succesfully run all the
code, it will generate a http URL. Copy and paste this URL in your
browser to launch the price calculator app.

To clean the data of all raw and unnecessary data files created during
the pipeline, run the following code in the command line / terminal:

    make clean

### Data Availability Statements

[external data listings]
[<https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html>]

### Details on each data source

[format, location, dictionary, packagesm references] [summary in table
form (name, files, location, provided, citation)]

### Dataset list

[table]

### Computational and software requirements

[libraries etc.] [memory and runtime requirements]

## References

-   Airbnb. (2021, 27 januari). Digital nomads find the perfect solution
    to work and live remotely while traveling the globe. Airbnb for
    Work.
    <https://www.airbnbforwork.com/resource/digital-nomads-find-the-perfect-solution-to-work-and-live-remotely-while-traveling-the-globe/>

-   Airbnb Guide to Live and Work Anywhere: How Communities Can Benefit
    from Remote Workers. (2022). In Airbnb. Geraadpleegd op 15 maart
    2023, van
    <https://news.airbnb.com/wp-content/uploads/sites/4/2022/09/Airbnb-Guide-to-Live-and-Work-Anywhere-15-September-2022-1.pdf>

-   Dubois, J., & Dubois, J. (2023, 22 februari). Digital Nomad and
    Remote Worker Guide to Living in Airbnbs. Deskless Nomad.
    <https://www.desklessnomad.com/remote-worker-guide-living-airbnbs/#>:\~:text=Airbnb%20is%20a%20great%20way,set%20of%20challenges%20and%20considerations

-   Masson, T. (2022a, februari 16). 2022 Airbnb strategy \| Rental
    Scale-Up. Rental Scale-Up.
    <https://www.rentalscaleup.com/2022-airbnb-strategy/>

-   Masson, T. (2022b, september 21). Airbnb's advice and data on how to
    attract digital nomads to your vacation rentals \| Rental Scale-Up.
    Rental Scale-Up.
    <https://www.rentalscaleup.com/airbnbs-advice-and-data-on-how-to-attract-digital-nomads/>

# sparql-data-in-looker-studio

The data, obtained from DBpedia using SPARQL, was imported into the Google Cloud Platform for presentation on the Looker Studio dashboard.

## Table of contents

1. [Overview](#Overview)
2. [GCP resources](#GCP-resources)
3. [Database](#Database)
4. [Dashboard](#Dashboard)

## Overview

The SPARQL query retrieves songs which last longer than 2 minutes. Each song has song name, artist name, artist origin, album, duration in seconds (maximal if there are duplicated entries), duration in minutes (it is calculated by dividing duration in seconds by 60 and maximal value is taken if there are duplicated entries), label (optional, the longest one if there are duplicated entries), description (optional, the longest one if there are duplicated entries).

Data is grouped because of the MAX() function and it gives exactly 31904 rows. So, it was needed to download 4 `.csv` files and merge them as https://dbpedia.org/sparql allows to download a maximum of 10000 rows.

## GCP resources

A bucket has been created in the `europe-north1` (Finland) location as it has low carbon emission etiquette and with the standard memory class (default).

I uploaded there my merged `.csv` file.

## Database

Database used is MySQL 8.0 (8.0.31). The Region is set to `europe-west1` (Belgium) as it has low carbon emission etiquette. I used Enterprise Cloud SQL version in the Sandbox mode.

In the Cloud Shell I created new database with a table using code in the `create_new_db.sql` file.

## Dashboard

There are four charts, three statistics and two controls.

### Screenshot

![image](https://github.com/mrkyc/sparql-data-in-looker-studio/assets/82812493/a2bfc798-56db-4239-8166-26e187b8f673)

### Charts

- Chart 1 (left upper corner) - It presents artists, their origin and number of songs that they have in our data. Currently it is sorted in the descendent order. You can see that The Beatles have the biggest number of songs in our data.
- Chart 2 (to the right from the chart 1) - It presents the five of the most common durations in minutes rounded to the first decimal place. The sixth slice presents others. You can see that about 1/5 of all songs has the specified durations.
- Chart 3 (left bottom corner) - It presents the number of songs written by artists from a particular location. It is sorted in the descendent order. You can see that most of the songs on the chart were written in London.
- Chart 4 (right bottom corner) - It presents the diagram with the artists based on their number of songs written in our data. It contains similar information to the chart 1 if the chart 1 is sorted as on the screen. However, it gives a better visualization of it. Chart 1 is rather used to scroll and check dozens of artists.

### Statistics

- Statistic 1 (Record Count) - the number of songs in our data
- Statistic 2 (Distinct Artist Count) - the number of unique artist in our data
- Statistic 3 (Description Count) - The number of songs with descriptions

### Controls

- Control 1 (durationInMinutes) - it allows to filter the data by putting a minimal number of minutes of a song. Default is set to 2 as our data contains songs that last more than 2 minutes.
- Control 2 (durationInSeconds) - it allows to filter the data by specifying the duration in seconds range. In our data, one song can be considered an "outlier" because it is 86400 seconds long duration and no other song comes close to it, but I decided to leave it as it is just a presentation of the appearance and functionality.

### One more screenshot with different controls settings

![image](https://github.com/mrkyc/sparql-data-in-looker-studio/assets/82812493/7411408f-88f3-4d76-8039-106e46df2eb1)

Chart 1 and Chart 4 do not match because the band with the most songs in Chart 4 has duplicates due to different artist origin formats.

# FoodClaimsProcess

### Tools
- PostgreSQL
- Tableau

## Introduction
Vivendo is a fast food chain in Brazil with over 200 outlets. As with many fast food establishments, customers make claims against the company. For example, they blame
Vivendo for suspected food poisoning. The legal team, who processes these claims, is currently split across four locations. The new head of the legal department wants to see if there are differences in the time it takes to close claims across the locations.

## Data Validation

The original data consists of 98 rows and 8 columns. The first thing i did was to make sure that each column has the correct data type assigned to them. In the process of doing that, there were a couple of rows that need to be cleaned, so i did some data cleaning by using functions like SUBSTRING, TO_NUMBER and COALESCE, then continue assigning data types to each one of them. When i was exploring the data, i found that there was a negative value in claim_amount, so i fixed it. Later, i found that there were 7 rows with a value of 0 in the individuals_on_claim column, since there is no detail regarding this column, i assumed it is a false claim and did not include it in the visualization. 

## Data Discovery and Visualization

### How does the number of claims differ across locations?

There are four locations and Sao Luis has the highest number of claims in all locations, namely 28. While the rest are not much different from each other, namely 22, 21, and 20 for Recife, Fortaleza and Natal, respectively. From these claims, there are so many unknown causes, followed by meat, and vegetables, which are only assigned to the legal team in Sao Luis and Recife.

![](https://github.com/rizkilaks/FoodClaimsProcess/blob/main/numofclaim_location.png?raw=true)

### What is the distribution of time to close claims?

This is how the 91 claims across 4 locations are distributed. From the histogram below we can tell that this is a right-skewed distribution with a peak between year 1 and 2. There are two claims that took more than 8 years to close and are considered outliers.

![](https://github.com/rizkilaks/FoodClaimsProcess/blob/main/numofclaim_timetoclose.png?raw=true)

### How does the average time to close claims differ by location?

When looking at the histogram above we excluded the location so that we could see the bigger picture. For a deeper look, we can take a look at the box plot below which compares the distributions of the time it takes to close a claim for each location. This plot shows the range of all data points, and a summary that displays median, quartile, and extreme points of a given dataset.

We found earlier that there were 2 outliers, but after looking at a more detailed visualization, it turned out that they are not outliers because the data points are still in the inside of the upper whisker. The outliers are, in fact, exists in the three other locations, namely Recife, Fortaleza and Natal, which can be seen lying outside the upper whiskers. Sao Luis is working on 28 claims, which explains why the interquartile range is much larger and the maximum value is much higher than other locations. If we take a look at other locations, they have a pretty similar interquartile range, that is because they work on a fairly similar number of claims, namely 20, 21, and 22.

![](https://github.com/rizkilaks/FoodClaimsProcess/blob/main/timetoclose_location.png?raw=true)

Based on all of the above, there is a difference in the time it takes to close a claim across the locations. Furthermore, the time it takes for Sao Luis to close a claim, can still be improved. We recommend that the management distribute the amount of work equitably to each legal team or add more workers to the Sao Luis legal team so that they can improve their performance.


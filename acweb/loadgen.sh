#!/bin/bash

###################################################################
# Source: Linux Acadamey PostgreSQL Administration Deep Dive Course
# Author: Landon Fowler
# Purpose: Script to generate load on the PostgreSQL server
# Date Updated: 03/10/2020
###################################################################


#Iterator
i=1

####
# Function to insert rows into sales.customer and select large amounts from sales.products
run_sql () {

  psql -d acweb -c "INSERT INTO sales.customer (first_name, last_name) VALUES ('Delmar', 'Database');"
  psql -d acweb -c "SELECT * FROM sales.products;" > /dev/null
}
####



#Infinitely loop and call the run_sql function
while [ $i -lt 2 ]
do
  run_sql
done
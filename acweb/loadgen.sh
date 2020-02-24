#!/bin/bash


################################################
# Script to gennerate loade on PostgreSQL server
################################################


#Iterator
i=1

####
# Function to insert rows into sales.customer and select large amounts from sales.products
run_sql () {

  psql -d acweb -c "INSERT INTO sales.customer (first_name, last_name) VALUES ('Delmar', 'Database');"
  psql -d acweb -c "SELECT * FROM sales.products;" > /dev/null
}
####



#Infinitely loop and call our function
while [ $i -lt 2 ]
do
  run_sql
done
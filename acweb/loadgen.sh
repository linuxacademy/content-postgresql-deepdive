#!/bin/bash


################################################
# Script to gennerate loade on PostgreSQL server
################################################

#Iterator
i=1

#Infinitely loop and insert rows to sales.customer
while [ $i -lt 2 ]
do
  psql -d acweb -c "INSERT INTO sales.customer (first_name, last_name) VALUES ('Delmar', 'Database');"
done
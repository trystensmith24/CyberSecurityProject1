#!/bin/bash

#Time must follow notation '"TIME""AM/PM"' i.e. 02AM or 12AM 
grep  ${2:0:2} $1_Dealer_schedule | grep  ${2:2:3} | awk  '{print $1,$2,$5,$6}'

#!/bin/bash

grep -i "08:00:00 AM" 0310_Dealer_schedule | awk  '{print $1,$2,$5,$6}'

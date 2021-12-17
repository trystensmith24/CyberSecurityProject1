#!/bin/bash

paths=( '/etc/shadow' '/etc/passwd' )

for path in ${paths[@]}
do
  ls -l $path
done

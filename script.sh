#!bin/bash

echo Results
python HammingDistance.py 100 64 10
printf "\n"
python HammingDistance.py 1000 64 10
printf "\n"
python HammingDistance.py 100 89 10
printf "\n"
python HammingDistance.py 1000 89 10
printf "\n" 
python HammingDistance.py 100 256 10
printf "\n"
python HammingDistance.py 1000 256 10
echo End


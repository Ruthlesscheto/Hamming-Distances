#!bin/bash

echo Results
python Hamming Distance.py 100 64 10
printf "\n"
python Hamming Distance.py 1000 64 10
printf "\n"
python Hamming Distance.py 100 89 10
printf "\n"
python Hamming Distance.py 1000 89 10
printf "\n" 
python Hamming Distance.py 100 256 10
printf "\n"
python Hamming Distance.py 1000 256 10
echo End


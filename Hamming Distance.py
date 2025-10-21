import random
import sys

stringLength = int(sys.argv[1])
numberOfStrings = int(sys.argv[2])
seed = int(sys.argv[3])
numbers = []
hammingDistances = []
def generateNumbers(number, length, seed):
    random.seed(seed) 
    for i in range(number):
        value = bin(random.getrandbits(length))
        numbers.append(value)           
pass

def calculate():
    for i in range(len(numbers)):
        for y in range(i+1, len(numbers)):
            if i != y:
                hammingDistance = bin(int(numbers[i], 2) ^ int(numbers[y], 2)).count('1')
                hammingDistances.append(hammingDistance)
pass

def checksum():
    checksum = sum(hammingDistances)
    print("Checksum: " + str(checksum))
pass

def average():
    average = sum(hammingDistances) / len(hammingDistances)
    
    print("Average: " + str(average))
pass

generateNumbers(numberOfStrings, stringLength, seed)
calculate() 
checksum()
average()
